# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  def create
    @subscription = Subscription.new(subscription_params)
    if account_signed_in?
      @subscription.account_id = current_account
      @subscription.save
      redirect_to community_path(@subscription.community_id)
    else
      redirect_to new_account_session_path
    end
  end

  def subscription_params
    params.require(:subscription).permit(:community_id)
  end
end
