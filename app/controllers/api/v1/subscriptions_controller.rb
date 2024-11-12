class Api::V1::SubscriptionsController < ApplicationController

  def index
    all_subs = Subscription.all
    render json: SubscriptionSerializer.new(all_subs)
  end

  def show
    begin
      subscription = Subscription.find(params[:id])
      tea = subscription.tea
      customer = subscription.customer
      render json: SubscriptionSerializer.format_one_sub(subscription, tea, customer)
    rescue ActiveRecord::RecordNotFound => error
      render json: ErrorSerializer.format_error(error), status: :not_found
    end
  end

  def update
    begin
      subscription = Subscription.find(params[:id])
      subscription.toggle_status
      render json: SubscriptionSerializer.new(subscription), status: :ok
    rescue ActiveRecord::RecordNotFound => error
      render json: ErrorSerializer.format_error(error), status: :not_found
    end
  end
end
