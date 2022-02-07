# frozen_string_literal: true

module Operations
  module MarsRoverInstructions
    class Create < ComposableOperations::Operation
      processes :params

      attr_accessor :rover, :mars_grid, :object

      def execute
        build
        # validate
        movement_instructions
        @object
      end

      private

      def build
        @object = Instruction.new(params[:instructions][:movement_commands], mars_grid, params[:instructions][:rover])
        @position = @object.rover.initial_position
        @current_degree = MarsGrid::CARDINAL[@object.rover.cardinal]
      end

      def validate
        @validator = ::Operations::MarsRoverInstructions::CreateValidator.new @object

        return if @validator.valid?

        halt @validator.errors
      end

      def movement_instructions
        @object.movement_instructions.each_char do |command|
          send(Instruction::DIRECTIONS[command])
        end

        @object.new_position = [@position, MarsGrid::CARDINAL.key(@current_degree)].join(' ')
      end

      def move
        @position = @position.zip(MarsGrid::COORDINATE_PLANE_ANGLES[@current_degree]).map { |x, y| x + y }
      end

      def left
        @current_degree = (current_degree_value_for('left') + 90).abs
      end

      def right
        @current_degree = (current_degree_value_for('right') - 90).abs
      end

      def current_degree_value_for(pos)
        case pos
        when 'right'
          @current_degree.zero? ? 360 : @current_degree
        when 'left'
          @current_degree == 360 ? 0 : @current_degree
        end
      end
    end
  end
end
