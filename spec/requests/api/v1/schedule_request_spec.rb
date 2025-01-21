require "rails_helper"

describe "Schedules endpoints", type: :request do
  describe "GET all schedules" do
    it "returns all schedules with associated user and shows" do
      user = User.create!(
        first_name: "John",
        last_name: "Doe",
        email: "john@yahoo.com"
      )
      schedule = user.schedules.create!(
        title: "John's Festival Schedule",
        date: "2025-07-01"
      )
      schedule.shows.create!([
        {
          artist: "The Beatles",
          genre: "Rock",
          location: "Stage 1",
          date: "2025-07-01",
          time: "12:00"
        },
        {
          artist: "Aretha Franklin",
          genre: "Soul",
          location: "Stage 2",
          date: "2025-07-01",
          time: "15:00"
        }
      ])

      get "/api/v1/schedules"
      expect(response).to be_successful

      data = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(data).to be_a(Array)
      expect(data.size).to eq(1)

      schedule_data = data.first[:attributes]
      expect(schedule_data[:title]).to eq(schedule.title)
      expect(schedule_data[:user][:first_name]).to eq(user.first_name)
      expect(schedule_data[:shows].size).to eq(2)
      expect(schedule_data[:shows].first[:artist]).to eq("The Beatles")
    end

    it "returns an empty array if no schedules exist" do
      get "/api/v1/schedules"
      expect(response).to be_successful

      data = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(data).to eq([])
    end
  end
end