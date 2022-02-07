# frozen_string_literal: true

module Operations
  module MarsRoverService
    class CreateValidator < BaseValidator
      MODEL = MarsRover

      validates :initial_position, presence: true
    end
  end
end
