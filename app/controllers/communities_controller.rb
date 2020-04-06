# frozen_string_literal: true

class CommunitiesController < ApplicationController
  before_authentication :authentication_account!, except: %i[index show]

  def index; end

  def show; end

  def new; end

  def create; end
end
