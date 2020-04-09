# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_account!, except: %i[index show edit destroy]
  before_action :set_post, only: [:show, :edit, :destroy]
  before_action :auth_subscriber, only: [:new, :edit, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

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

  def edit
    @post
  end

  def update
    @post = set_post
    if @post.update(post_params)
      redirect_to community_posts_path(@post)
        else
      render 'edit'
    end
  end

  def destroy
      @post.destroy
  end

  private

  def set_post
    @post = Post.includes(:comments).find(params[:id])
  end

  def auth_subscriber
    unless Subscription.where(community_id: params[:community_id], account_id: current_account).any?
      redirect_to root_path, flash: { danger: 'You are not authorized to view this page' }
    end
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
