# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_account!, except: %i[index show]
  before_action :set_post, only: [:show]

  def index
    @posts = Post.all
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.account = current_account

    if @post.save
      redirect_to communities_path(@post.community_id)
    else
      render 'new'
    end
    end

  private

  def post_params
    params.require(:post).permit(:title, :body, :rules)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
