require 'rails_helper'

describe HomeController, type: :controller  do
  context "#create" do
    it "with a valid instructions" do
      post :create, params: { file: 'rover-sample.txt' }
      expect(JSON.parse(response.body)[0]).to include("1 3 N")
      expect(JSON.parse(response.body)[1]).to include("5 1 E")
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

  context "#create" do
    it "with a invalid instructions" do
      post :create, params: { file: 'rover-invalid-plateau.txt' }
      expect(JSON.parse(response.body)['errors'][0]['message']).to include("Plateau inválido, verifique se o valor de X é igual a 5")
    end
  end

  context "#create" do
    it "with a invalid instructions" do
      post :create, params: { file: 'rover-error-cardinal.txt' }
      expect(JSON.parse(response.body)['errors'][0]['message']).to include("Cardinal inválido, verifique se o valor corresponde a (N E S W)")
    end
  end
end
