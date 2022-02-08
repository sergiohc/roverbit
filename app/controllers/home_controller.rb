# frozen_string_literal: true

class HomeController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index; end

  def create
   operator = ::Operations::MoveMarsRovers.new params
   operator.perform

   if operator.succeeded?
     render json: operator.object.map(&:new_position)
   else
     render json: operator.errors.messages
   end
  end
end
