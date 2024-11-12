class Api::V1::SubscriptionsController < ApplicationController
  
  def index
    all_subs = Subscriptions.all
    render json: all_subs
  end

end