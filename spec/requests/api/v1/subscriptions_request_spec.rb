require 'rails_helper'

RSpec.describe "Subscriptions Endpoints" do
  before(:each) do
    @charlie = Customer.create!(first_name: "Charlie", last_name: "Brown", email: "charlie@example.com", address: "789 Maple St, Denver, CO")
    @green_tea = Tea.create!(title: "Green Tea", description: "A refreshing tea with a light, grassy flavor", tempature: 80, brew_time: 3)
    @chamomile = Tea.create!(title: "Chamomile", description: "A calming herbal tea with floral notes", tempature: 95, brew_time: 5)
    @charlie_sub = Subscription.create!(title: "Monthly Green Tea Subscription", price: 10.99, status: true, frequency: "monthly", tea_id: @green_tea.id, customer_id: @charlie.id)
    @charlie_sub2 = Subscription.create!(title: "Weekly Chamomile Subscription", price: 4.99, status: false, frequency: "weekly", tea_id: @chamomile.id, customer_id: @charlie.id)
  end

  describe 'Index' do
    it 'returns all subscription' do
      get "/api/v1/subscriptions"

      json = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(response).to be_successful
      expect(json.length).to eq(2)
      expect(json.first[:attributes][:title]).to eq("Monthly Green Tea Subscription")
      expect(json.last[:attributes][:title]).to eq("Weekly Chamomile Subscription")
    end
  end

  describe 'Show - Happy Path' do
    it 'returns one subscription by ID number' do
      get "/api/v1/subscriptions/#{@charlie_sub.id}"

      json = JSON.parse(response.body, symbolize_names: true)
  
      expect(response).to be_successful
      expect(json[:attributes][:subscription][:title]).to eq("Monthly Green Tea Subscription")
      expect(json[:attributes][:tea][:title]).to eq("Green Tea")
      expect(json[:attributes][:customer][:first_name]).to eq("Charlie")
    end
  end

  describe 'Show - Sad Path' do
    it 'handles an incorrect ID' do
      get "/api/v1/subscriptions/123456789"

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response).to have_http_status((:not_found))
      expect(json[:status]).to eq(404)
      expect(json[:message]).to eq("Couldn't find Subscription with 'id'=123456789")
    end
  end

  describe 'Update - Happy Path' do
    it 'toggles active status' do
      patch "/api/v1/subscriptions/#{@charlie_sub2.id}"

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)
    end
  end

  describe 'Update - Sad Path' do
    it 'handles incorrect ID' do
      patch "/api/v1/subscriptions/99999999"
      
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response).to have_http_status((:not_found))
      expect(json[:status]).to eq(404)
      expect(json[:message]).to eq("Couldn't find Subscription with 'id'=99999999")
    end
  end
end