# frozen_string_literal: true

class Community < ApplicationRecord
  belongs_to :account
  validates_presence_of :url, :name
end
