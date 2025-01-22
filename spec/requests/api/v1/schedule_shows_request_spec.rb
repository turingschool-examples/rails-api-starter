require "rails_helper"

describe "Schedule Shows endpoints", type: :request do
  describe "DELETE a show from a schedule" do
    it "removes a show from a schedule" do
      user = User.create!(
        first_name: "Jane",
        last_name: "Doe",
        email: "jane.doe@example.com"
      )
      schedule = user.schedules.create!(
        title: "Jane's Festival Schedule",
        date: "2025-07-01"
      )
      show = schedule.shows.create!(
        artist: "The Beatles",
        genre: "Rock",
        location: "Main Stage",
        date: "2025-07-01",
        time: "12:00"
      )

      delete "/api/v1/schedules/#{schedule.id}/shows/#{show.id}"

      expect(response).to be_successful
      expect(schedule.shows).not_to include(show)

      message = JSON.parse(response.body, symbolize_names: true)[:message]
      expect(message).to eq("Show successfully removed from the schedule")
    end

    it "returns an error if the show does not exist" do
      user = User.create!(
        first_name: "Jane",
        last_name: "Doe",
        email: "jane.doe@example.com"
      )
      schedule = user.schedules.create!(
        title: "Jane's Festival Schedule",
        date: "2025-07-01"
      )

      delete "/api/v1/schedules/#{schedule.id}/shows/999"

      expect(response).to have_http_status(:not_found)

      error = JSON.parse(response.body, symbolize_names: true)
      expect(error[:error]).to eq("Show not found in the schedule")
    end

    it "returns an error if the schedule does not exist" do
      delete "/api/v1/schedules/999/shows/1"

      expect(response).to have_http_status(:not_found)

      error = JSON.parse(response.body, symbolize_names: true)
      expect(error[:error]).to eq("Schedule not found")
    end
  end
end
