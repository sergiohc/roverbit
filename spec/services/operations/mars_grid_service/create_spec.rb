require 'rails_helper'

RSpec.describe ::Operations::MarsGridService::Create, type: :service do
  context '#create' do
    it 'when params are valid' do
      @operator = ::Operations::MarsGridService::Create.new ["5", "5"]
      @operator.perform
      @mars_grid = @operator.object


      expect(@operator.succeeded?).to be_truthy
      expect(@operator.object.nil?).to be_falsy
      expect(@operator.object.plateau).to eq ["5", "5"]
    end

    it 'when params are invalid' do
      @operator = ::Operations::MarsGridService::Create.new ''
      @operator.perform
      @mars_grid = @operator.object

      expect(@operator.succeeded?).to be_falsy
      expect(@operator.errors[:errors].count).to eq 3
    end

    it 'when params exist but invalid' do
      @operator = ::Operations::MarsGridService::Create.new ['T', "5"]
      @operator.perform
      @mars_grid = @operator.object

      expect(@operator.succeeded?).to be_falsy
      expect(@operator.errors[:errors].count).to eq 1
      expect(@operator.errors[:errors][0][:message]).to eq('Plateau inválido, verifique se o valor de X é igual a 5')
    end
  end
end
