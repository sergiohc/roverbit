# frozen_string_literal: true

module Operations
  class MoveMarsRovers < ComposableOperations::Operation
    processes :params

    attr_reader :object, :validator

    delegate :errors, to: :validator

    def execute
      validate
      build
      @object
    end

    private

    def validate
      @validator = ::Operations::MoveMarsRoversValidator.new params[:file]
      return if @validator.valid?

      halt @validator.errors
    end

    def build
      @file_chomp = File.readlines(params[:file], chomp: true)
      @plateau = @file_chomp[0].split
      @mars_grid = create_mars_grid
      @instructions = parse_instructions([], 1)
      @object = move_rover
    end

    def parse_instructions(instructions, count)
      @file_chomp[1..4].select.with_index do |value, index|
        if index.even?
          instructions << { instructions: { rover: create_rover(value) } }
        else
          instructions[index - count][:instructions].merge!(movement_commands: value)
          count += 1
        end
      end
      instructions
    end

    def create_mars_grid
      operator = ::Operations::MarsGridService::Create.new @plateau
      operator.perform

      return operator.object if operator.succeeded?

      halt operator.message
    end

    def create_rover(position)
      operator = ::Operations::MarsRoverService::Create.new position
      operator.perform

      return operator.object if operator.succeeded?

      halt operator.message
    end

    def move_rover
      @instructions.map do |instructions|
        operator = ::Operations::MarsRoverInstructions::Create.new instructions
        operator.mars_grid = @mars_grid
        operator.perform
        operator.object
      end
    end
  end
end
