# frozen_string_literal: true

module Operations
  module MarsGridService
    class CreateValidator < BaseValidator
      validate :array?
      validate :axis_x_present?
      validate :axis_y_present?

      protected

      def array?
        return true if plateau.is_a?(Array)

        errors.add(:errors, message: 'Plateau inválido, verifique a primeira linha do arquivo')
        false
      end

      def axis_x_present?
        return true if x_axis.present? && x_axis == '5'

        errors.add(:errors, message: 'Plateau inválido, verifique se o valor de X é igual a 5')
        false
      end

      def axis_y_present?
        return true if y_axis.present? && y_axis == '5'

        errors.add(:errors, message: 'Plateau inválido, verifique se o valor de Y é igual a 5')
        false
      end
    end
  end
end
