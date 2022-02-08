# frozen_string_literal: true

module MarsGridHelper
  extend ActiveSupport::Concern

  COORDINATE_PLANE_ANGLES = {
    90 => [0, 1],
    180 => [-1, 0],
    270 => [0, -1],
    360 => [1, 0],
    0 => [1, 0]
  }.freeze

  CARDINAL = {
    'N' => 90,
    'E' => 0,
    'S' => 270,
    'W' => 180
  }.freeze
end
