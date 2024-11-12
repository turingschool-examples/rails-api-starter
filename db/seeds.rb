# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

customer1 = Customer.create!(
  first_name: "Lucy",
  last_name: "Van Pelt",
  email: "lucy@example.com",
  address: "123 Main St, Springfield, IL"
)

customer2 = Customer.create!(
  first_name: "Pepperment",
  last_name: "Patty",
  email: "patty@example.com",
  address: "456 Elm St, Austin, TX"
)

customer3 = Customer.create!(
  first_name: "Charlie",
  last_name: "Brown",
  email: "charlie@example.com",
  address: "789 Maple St, Denver, CO"
)

green_tea = Tea.create!(
  title: "Green Tea",
  description: "A refreshing tea with a light, grassy flavor",
  tempature: 80,
  brew_time: 3
)

chamomile = Tea.create!(
  title: "Chamomile",
  description: "A calming herbal tea with floral notes",
  tempature: 95,
  brew_time: 5
)

earl_grey = Tea.create!(
  title: "Earl Grey",
  description: "A classic black tea with a hint of bergamot",
  tempature: 90,
  brew_time: 4
)

Subscription.create!(
  title: "Monthly Green Tea Subscription",
  price: 10.99,
  status: true,
  frequency: "monthly",
  tea_id: green_tea.id,
  customer_id: customer1.id
)

Subscription.create!(
  title: "Weekly Chamomile Subscription",
  price: 4.99,
  status: true,
  frequency: "weekly",
  tea_id: chamomile.id,
  customer_id: customer2.id
)

Subscription.create!(
  title: "Biweekly Earl Grey Subscription",
  price: 7.99,
  status: false,
  frequency: "biweekly",
  tea_id: earl_grey.id,
  customer_id: customer3.id
)