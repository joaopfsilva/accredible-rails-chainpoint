require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  let(:params) do
    {
      blockchain: :chainpoint,
      home: {
        issue_date: "01/04/2021",
        recipient_name: "Joao",
        uuid: "12345654321"
      }
    }
  end

  let(:stubbed_valid_response) do
    File.read("spec/fixtures/blockchain_chainpoint_submit_response_valid.json")
  end

  describe "GET new" do
    it "Renders default landing page" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #submit" do
    it "Return confirmation from Chainpoint blockchain" do
      allow_any_instance_of(BlockchainService).to receive(:submit_to_blockchain).with(data: params).and_return(stubbed_valid_response)
      # allow_any_instance_of(BlockchainService).to receive(:submit_to_blockchain).with(params).and_return(stubbed_valid_response)

      post "submit", params: { home: params }
      expect(response).to redirect_to(success_path)
    end
  end
end
