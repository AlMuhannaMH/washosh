# frozen_string_literal: true

class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :subscriptions, dependent: :nullify
  has_many :communities, through: :subscriptions
  has_many :posts
  has_many :comments
  has_many :votes

  validates_presence_of :first_name, :last_name, :username
  validates_uniqueness_of :username, :email

  def full_name
    "#{first_name} #{last_name}"
  end

  def upvoted_post_ids
    votes.where(upvote: true).pluck(:post_id)
  end

  def downvoted_post_ids
    votes.where(upvote: false).pluck(:post_id)
  end
end
