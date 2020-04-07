# frozen_string_literal: true

class CommunitiesController < ApplicationController
  before_action :authenticate_account!, except: %i[index show]
  before_action :set_community, only: [:show]

  def index
    @communities = Community.all
  end

  def show
    @posts = @community.posts
    @subscriber_count = @community.subscribers.count
    @is_subscribed = account_signed_in? ? Subscription.where(community_id: @community.id, account_id: current_account.id).any? : false
    @subscription = Subscription.new
  end

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)
    @community.account = current_account.id

    if @community.save
      redirect_to @community
    else
      render 'new'
    end
  end

  private

  def community_params
    params.require(:community).permit(:name, :url, :summary, :rules)
  end

  def set_community
    @community = Community.find(params[:id])
  end
end
