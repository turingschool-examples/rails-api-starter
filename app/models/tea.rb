class Tea < ApplicationRecord
  has_many :subscriptions
  # have_many :customers, through :subscriptions
end