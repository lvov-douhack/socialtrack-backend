class IndexController < ApplicationController

  before_filter :authenticate_user!, only: [:token, :stats]

  def home

  end

  def token
    @user = current_user
  end

  def stats

  end

end
