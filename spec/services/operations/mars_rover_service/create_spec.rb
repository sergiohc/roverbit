require 'rails_helper'

RSpec.describe ::Operations::MarsRoverService::Create, type: :service do
  context '#create' do
    it 'when params are valid' do
      @operator = ::Operations::MarsRoverService::Create.new "3 3 N"
      @operator.perform
      @mars_rover = @operator.object


      expect(@operator.succeeded?).to be_truthy
    end

    it 'when params are valid' do
      @operator = ::Operations::MarsRoverService::Create.new "3 3 T"
      @operator.perform
      @mars_rover = @operator.object

      expect(@operator.succeeded?).to be_falsy
      expect(@operator.errors[:errors][0][:message]).to eq('Cardinal inválido, verifique se o valor corresponde a (N E S W)')
    end
  end
end
