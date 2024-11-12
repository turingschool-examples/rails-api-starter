class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes :active, :frequency

  belongs_to :customer
  belongs_to :tea
end
