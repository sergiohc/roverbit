# frozen_string_literal: true

class MarsGrid
  include MarsGridHelper

  attr_accessor :plateau
  attr_reader :x_axis, :y_axis

  def x_axis
    plateau[0]
  end

  def y_axis
    plateau[1]
  end
end
