class Api::V1::SubscriptionsController < ApplicationController
    def index
        subscriptions = Subscription.all
        render json: SubscriptionSerializer.new(subscriptions).serializable_hash
    end

    def show
        subscription = Subscription.find_by(id: params[:id].to_i)
        render json: SubscriptionSerializer.new(subscription).serializable_hash
    end

    def update
        subscription = Subscription.find_by(id: params[:id].to_i)

        if params[:toggle_active]
            subscription.toggle_active
            subscription.save!
        end

        render json: SubscriptionSerializer.new(subscription).serializable_hash
    end

    # private

    # def subscription_params
    #     params.permit(:active)
    # end
end