class Show < ApplicationRecord
  has_many :schedule_shows
  has_many :schedules, through: :schedule_shows

  validates :artist, :genre, :location, :date, :time, presence: true
end