class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes :title, :price, :status, :frequency

  # belongs_to :tea, serializer: TeaSerializer

  def self.format_one_sub(subscription, tea, customers)
    customer_data = format_customers(subscription, customers)

    {
      "id": subscription.id.to_s,
      "type": "subscription",
      "attributes": {
        "subscription": {
          "title": subscription.title,
          "price": subscription.price,
          "frequency": subscription.frequency
        },
        "tea": {
          "id": tea.id,
          "title": tea.title,
          "description": tea.description,
          "tempature": tea.tempature,
          "brew_time": tea.brew_time
          },
        "customers": customer_data
        }
      }
  end

  private

  def self.format_customers(subscription, customers)
    customers.map do |customer|
      customer_subscription = customer.subscriptions.find_by(tea_id: subscription.tea_id)
      {
        "id": customer.id,
        "first_name": customer.first_name,
        "last_name": customer.last_name,
        "email": customer.email,
        "status": customer_subscription&.status
      }
    end
  end

end
