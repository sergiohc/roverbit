# frozen_string_literal: true

module Operations
  module MarsRoverService
    class Create < ComposableOperations::Operation
      processes :params

      attr_reader :object

      def execute
        build
        validate
        @object
      end

      private

      def validate
        @validator = ::Operations::MarsRoverService::CreateValidator.new @object

        return if @validator.valid?

        halt @validator.errors
      end

      def build
        @parse_attributes = params.gsub(' ', '')
        @object = MarsRover.new
        @object.initial_position = [@parse_attributes[0].to_i, @parse_attributes[1].to_i]
        @object.cardinal = @parse_attributes[2]
      end
    end
  end
end
