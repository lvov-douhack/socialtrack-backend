class IndexController < ApplicationController

  before_filter :authenticate_user!, only: [:token]

  def home

  end

  def token
    @user = current_user
  end

end
