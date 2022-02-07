# frozen_string_literal: true

module Operations
  module MarsGridService
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
        @validator = ::Operations::MarsGridService::CreateValidator.new @object

        return if @validator.valid?

        halt @validator.errors
      end

      def build
        @object = MarsGrid.new
        @object.plateau = params
      end
    end
  end
end
