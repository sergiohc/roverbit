require 'rails_helper'

describe HomeController, type: :controller  do
  describe "#create" do
    it "Create new rover instructions" do
      post :create, params: { file: 'rover-sample.txt' }
    end

    it "Create new rover instructions" do
      post :sample, params: { file: 'rover-sample.txt' }
    end
  end
end