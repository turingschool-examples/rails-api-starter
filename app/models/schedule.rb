class Schedule < ApplicationRecord
  belongs_to :user
  has_many :schedule_shows
  has_many :shows, through: :schedule_shows

  validates :title, presence: true
  validates :date, presence: true

  def remove_show(show_id)
    show = shows.find_by(id: show_id)
    return false if show.nil?

    shows.destroy(show)
    true
  end
end