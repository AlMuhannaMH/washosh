# frozen_string_literal: true

class PublicController < ApplicationController
  def index
    @communities = Community.all.limit(3)
    @posts = Post.order(id: :desc).limit(2)
  end
end
