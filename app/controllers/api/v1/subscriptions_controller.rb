class Api::V1::SubscriptionsController < ApplicationController

  def index
    # begin
      all_subs = Subscription.all
      render json: SubscriptionSerializer.new(all_subs)
    # rescue => error
    #   render json: ErrorSerializer.format_error(error.message)
    # end
  end

  def show
      subscription = Subscription.find_by(id: params[:id])
      if subscription.nil?
        render json: ErrorSerializer.format_error(sub_not_found), status: :not_found
      else
        tea = subscription.tea
        customer = subscription.customer
        render json: SubscriptionSerializer.format_one_sub(subscription, tea, customer)
      end
  end

  private

  # def subscription_params
  #   params.require(:subscription).permit(:id)
  # end

  def sub_not_found
   {message: "subscription not found", status_code: "404"}
  end
end