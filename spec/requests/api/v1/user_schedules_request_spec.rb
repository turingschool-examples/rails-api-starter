require "rails_helper"

describe "A user's schedules endpoints", type: :request do
  describe "GET all schedules for a single user" do
    it "returns all schedules for a specific user with associated shows" do
      user = User.create!(
        first_name: "Jane",
        last_name: "Doe",
        email: "deer@aol.com"
      )
      schedule = user.schedules.create!(
        title: "Jane's Festival Schedule",
        date: "2025-07-02"
      )
      schedule.shows.create!([
        {
          artist: "Elton John",
          genre: "Pop",
          location: "Main Stage",
          date: "2025-07-02",
          time: "18:00"
        },
        {
          artist: "The Rolling Stones",
          genre: "Rock",
          location: "Stage 2",
          date: "2025-07-02",
          time: "20:00"
        }
      ])

      get "/api/v1/users/#{user.id}/schedules"
      expect(response).to be_successful

      data = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(data).to be_a(Array)
      expect(data.size).to eq(1)

      schedule_data = data.first[:attributes]
      expect(schedule_data[:title]).to eq(schedule.title)
      expect(schedule_data[:shows].size).to eq(2)
      expect(schedule_data[:shows].first[:artist]).to eq("Elton John")
    end

    it "returns an error if the user does not exist" do
      get "/api/v1/users/999/schedules"
      expect(response).to have_http_status(:not_found)

      error = JSON.parse(response.body, symbolize_names: true)
      expect(error[:error]).to eq("User not found")
    end

    it "returns an empty array if the user has no schedules" do
      user = User.create!(
        first_name: "Jane",
        last_name: "Doe",
        email: "deer@aol.com"
      )

      get "/api/v1/users/#{user.id}/schedules"
      expect(response).to be_successful

      data = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(data).to eq([])
    end
  end
end
