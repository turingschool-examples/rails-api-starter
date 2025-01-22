require 'rails_helper'

RSpec.describe Schedule, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:date) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:schedule_shows) }
    it { should have_many(:shows).through(:schedule_shows) }
  end

  describe '#remove_show' do
    let(:user) { User.create!(first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com') }
    let!(:schedule) { user.schedules.create!(title: "Festival Schedule", date: "2025-07-01") }
    let!(:show) { schedule.shows.create!(artist: "The Beatles", genre: "Rock", location: "Stage 1", date: "2025-07-01", time: "12:00") }
   
    it 'removes an associated show successfully' do
      expect(schedule.shows).to include(show)
      result = schedule.remove_show(show.id)
      expect(result).to be(true)
      expect(schedule.shows).not_to include(show)
    end
  
    it 'returns false if the show does not exist' do
      result = schedule.remove_show(999)
      expect(result).to be(false)
    end
  end
end

