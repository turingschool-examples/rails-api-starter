require 'rails_helper'

RSpec.describe Subscription do
  describe "validations" do
    it { should belong_to :customer }
    it { should belong_to :tea }
  end

  describe 'toggle_status' do
    it 'can change active status true/false' do
      charlie = Customer.create!(first_name: "Charlie", last_name: "Brown", email: "charlie@example.com", address: "789 Maple St, Denver, CO")
      green_tea = Tea.create!(title: "Green Tea", description: "A refreshing tea with a light, grassy flavor", tempature: 80, brew_time: 3)
      charlie_sub = Subscription.create!(title: "Monthly Green Tea Subscription", price: 10.99, status: true, frequency: "monthly", tea_id: green_tea.id, customer_id: charlie.id)
      
      expect(charlie_sub.status).to eq(true)
      charlie_sub.toggle_status
      expect(charlie_sub.status).to eq(false)
    end
  end
end