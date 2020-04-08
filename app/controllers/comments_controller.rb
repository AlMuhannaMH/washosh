# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = Comment.new comment_params
    @comment.account_id = current_account.id

    respond_to do |format|
      format.js do
        if @comment.save
          @comments = Comment.where(post_id: @comment.post_id)
          render 'comments/create'
        else
          redirect_to root_path, flash: { danger: 'unable to save' }
        end
      end
    end
  end

  def comment_params
    params.require(:comment).permit(:message, :post_id)
  end
end