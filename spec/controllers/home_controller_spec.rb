require 'rails_helper'

describe HomeController, type: :controller  do
  describe "#create" do
    it "with a valid instructions" do
      post :create, params: { file: 'rover-sample.txt' }
      expect(JSON.parse(response.body)[0]).to include("1 3 N")
      expect(JSON.parse(response.body)[1]).to include("1 5 E")
    end

    it "with a invalid instructions" do
      post :create, params: { file: '' }
      expect(JSON.parse(response.body)['errors'][0]['message']).to include("Arquivo não encontrado")
    end

    it "file existis but have a invalid instructions" do
      post :create, params: { file: 'rover-error.txt' }
      expect(JSON.parse(response.body)['errors'][0]['message']).to include("A configuração do arquivo não é valida")
    end
  end
end
