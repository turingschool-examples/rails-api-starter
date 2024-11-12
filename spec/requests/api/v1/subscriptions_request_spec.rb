require 'rails_helper'

RSpec.describe "Subscriptions Endpoints" do
  before(:each) do
    charlie = Customer.create!(first_name: "Charlie", last_name: "Brown", email: "charlie@example.com", address: "789 Maple St, Denver, CO")
    green_tea = Tea.create!(title: "Green Tea", description: "A refreshing tea with a light, grassy flavor", tempature: 80, brew_time: 3)
    charlie_sub = Subscription.create!(title: "Monthly Green Tea Subscription", price: 10.99, status: true, frequency: "monthly", tea_id: green_tea.id, customer_id: charlie.id)
    charlie_sub2 = Subscription.create!(title: "Green Tea Time", price: 10.99, status: true, frequency: "monthly", tea_id: green_tea.id, customer_id: charlie.id)
  end

  describe 'Index - Happy Path' do
    it 'returns all subscription' do
      get "/api/v1/subscriptions"

      json = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(response).to be_successful
      expect(json.length).to eq(2)
      expect(json.first[:attributes][:title]).to eq("Monthly Green Tea Subscription")
      expect(json.last[:attributes][:title]).to eq("Green Tea Time")
    end
  end

  # describe "Index - Sad Path" do
  #   it 'returns an error message' do

  #   end
  # end

  describe 'Show - Happy Path' do
    it 'returns one subscription by ID number' do
      charlie = Customer.create!(first_name: "Charlie", last_name: "Brown", email: "charlie@example.com", address: "789 Maple St, Denver, CO")
      green_tea = Tea.create!(title: "Green Tea", description: "A refreshing tea with a light, grassy flavor", tempature: 80, brew_time: 3)
      charlie_sub = Subscription.create!(title: "Monthly Green Tea Subscription", price: 10.99, status: true, frequency: "monthly", tea_id: green_tea.id, customer_id: charlie.id)
      
      get "/api/v1/subscriptions/#{charlie_sub.id}"

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(json.length).to eq(1)
      # require 'pry'; binding.pry
    end
  end

  describe 'Show - Sad Path' do
    it 'handles an incorrect ID' do

      get "/api/v1/subscriptions/123456789"

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(404)
      expect(json[:message]).to eq("subscription not found")
    end
  end
end