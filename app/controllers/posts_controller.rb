# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_account!, except: %i[index show]
  before_action :set_post, only: [:show]
  before_action :auth_subscriber, only: [:new]

  def index
    @posts = Post.all
  end

  def show; end

  def new
    @community = Community.find(params[:community_id])
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.account = current_account
    @post.community_id = params[:community_id]

    if @post.save
      redirect_to community_path(@post.community_id)
    else
      @community = Community.find(params[:community_id])
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :rules)
  end

  def auth_subscriber
    unless Subscription.where(community_id: params[:community_id], account_id: current_account.id).any?
      redirect_to root_path, flash: { danger: 'You are not authorized to view this page' }
    end
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
