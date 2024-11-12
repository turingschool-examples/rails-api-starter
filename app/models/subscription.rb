class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea

  validates :customer_id, uniqueness: { scope: :tea_id, message: "is already subscribed to this tea" }

  def toggle_status
    update(status: !status)
  end

end