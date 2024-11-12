class Api::V1::SubscriptionsController < ApplicationController
  def index
    subscriptions = Subscription.all
    render json: subscriptions.as_json(only: [:id, :title, :price, :status, :frequency, :customer_id])
  end

  def show
    subscription = Subscription.find(params[:id])
      render json: {
        id: subscription.id,
        title: subscription.title,
        price: subscription.price,
        status: subscription.status,
        frequency: subscription.frequency,
        customer: {
          first_name: subscription.customer.first_name,
          last_name: subscription.customer.last_name,
          email: subscription.customer.email,
          address: subscription.customer.address
        },
        teas: subscription.teas.map { |tea|  { title: tea.title, description: tea.description } }
      }
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Subscription not found' }, status: :not_found
  end

  def update
    subscription = Subscription.find(params[:id])
    
    if subscription.update(status: 'canceled')
      render json: {
        id: subscription.id,
        title: subscription.title,
        price: subscription.price,
        status: subscription.status,
        frequency: subscription.frequency,
        customer: {
          first_name: subscription.customer.first_name,
          last_name: subscription.customer.last_name,
          email: subscription.customer.email,
          address: subscription.customer.address
        },
        teas: subscription.teas.map { |tea| { title: tea.title, description: tea.description } }
      }, status: :ok
    else
      render json: { message: 'Failed to update subscription' }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Subscription not found' }, status: :not_found
  end
end
