class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes :active, :frequency

  attribute :customer do |object|
    CustomerSerializer.new(object.customer).serializable_hash[:data]
  end

  attribute :tea do |object|
    TeaSerializer.new(object.tea).serializable_hash[:data]
  end
end
