# frozen_string_literal: true

module Operations
  module MarsGridService
    class CreateValidator < BaseValidator
      MODEL = MarsGrid

      validates :plateau, presence: true
    end
  end
end
