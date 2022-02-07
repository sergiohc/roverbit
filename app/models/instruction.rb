# frozen_string_literal: true

class Instruction
  DIRECTIONS =  { 'L' => :left, 'R' => :right, 'M' => :move }.freeze

  attr_accessor :rover, :mars_grid, :movement_instructions, :new_position

  def initialize(movement_instructions, mars_grid, rover)
    @movement_instructions = movement_instructions
    @mars_grid = mars_grid
    @rover = rover
  end
end
