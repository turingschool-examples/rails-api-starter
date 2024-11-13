class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea

  def toggle_active
    self.active = !self.active
  end
end