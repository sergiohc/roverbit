# frozen_string_literal: true

module Operations
  module MarsRoverInstructions
    class CreateValidator < BaseValidator
      MODEL = MarsRoverInstructions

      validates :rover, presence: true
      validates :mars_grid, presence: true
      validates :movement_instructions, presence: true
    end
  end
end
