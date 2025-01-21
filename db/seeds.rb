# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

User.destroy_all
Show.destroy_all


3.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email
  )
end

locations = ["Stage 1", "Stage 2", "Stage 3", "Stage 4", "Stage 5"]

5.times do
  Show.create!(
    artist: Faker::Music.band,
    genre: Faker::Music.genre,
    location: locations.sample,
    date: Faker::Date.between(from: "2025-07-01", to: "2025-07-03"),
    time: Faker::Time.between_dates(from: "2025-07-01", to: "2025-07-03", period: :all)
  )
end