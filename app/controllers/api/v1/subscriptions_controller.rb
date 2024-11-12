class Api::V1::SubscriptionsController < ApplicationController
  
  def index
    all_subs = Subscription.all
    render json: all_subs
  end

end