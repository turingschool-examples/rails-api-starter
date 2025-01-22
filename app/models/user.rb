class User < ApplicationRecord
  has_many :schedules

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
end