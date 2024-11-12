require 'rails_helper'

RSpec.describe "Api::V1::Subscriptions", type: :controller do
  let(:customer) { create(:customer) }
  let(:subscription) { create(:subscription, customer: customer) }
  let(:tea) { create(:tea) }

  before do
    subscription.teas << tea
  end

  describe "GET /index" do
    it "returns all subscriptions" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
end