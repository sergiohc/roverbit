# frozen_string_literal: true

module Operations
  module MarsRoverService
    class CreateValidator < BaseValidator
      MODEL = MarsRover

      validates :initial_position, presence: true
      validates :cardinal, presence: true
      validate :correct_cardinals?

      protected

      def correct_cardinals?
        return true if ('W S E N').match?(cardinal)

        errors.add(:errors, message: 'Cardinal inválido, verifique se o valor corresponde a (N E S W)')
        false
      end
    end
  end
end
