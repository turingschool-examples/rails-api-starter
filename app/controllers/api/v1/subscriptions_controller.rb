class Api::V1::SubscriptionsController < ApplicationController
  # rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    # begin
    all_subs = Subscription.all
    render json: SubscriptionSerializer.new(all_subs)
    # rescue => error
    #   render json: ErrorSerializer.format_error(error.message)
    # end
  end

  # def show
  #   subscription = Subscription.find_by(id: params[:id])
  #   if subscription.nil?
  #     render json: ErrorSerializer.format_error(sub_not_found), status: :not_found
  #   else
  #     tea = subscription.tea
  #     customer = subscription.customer
  #     render json: SubscriptionSerializer.format_one_sub(subscription, tea, customer)
  #   end
  # end

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

  # def update
  #   subscription = Subscription.find_by(id: params[:id])
  #   if subscription
  #     subscription.toggle_status
  #     render json: SubscriptionSerializer.new(subscription), status: :ok
  #   else
  #     render json: ErrorSerializer.format_error(sub_not_found), status: :not_found
  #   end
  # end

  def update
    begin
      subscription = Subscription.find(params[:id])
      subscription.toggle_status
      render json: SubscriptionSerializer.new(subscription), status: :ok
    rescue ActiveRecord::RecordNotFound => error
      render json: ErrorSerializer.format_error(error), status: :not_found
    end
  end

  private

  # def subscription_params
  #   params.require(:subscription).permit(:id)
  # end

  # def handle_not_found
  #   render json: ErrorSerializer.format_error(sub_not_found), status: :not_found
  # end

  # def sub_not_found
  #  {message: "subscription not found", status_code: "404"}
  # end
end