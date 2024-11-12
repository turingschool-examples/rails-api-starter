require 'rails_helper'

RSpec.describe "Api::V1::Subscriptions", type: :request do
  let(:customer) { create(:customer) }
  let(:subscription) { create(:subscription, customer: customer) }
  let(:tea) { create(:tea) }

  before do
    subscription.teas << tea
  end

  describe "GET /index" do
    it "returns all subscriptions" do
      get "/api/v1/subscriptions"
      
      expect(response).to have_http_status(:ok)

      json_response = JSON.parse(response.body)
      
      expect(json_response.size).to eq(Subscription.count)
    end
  end
end