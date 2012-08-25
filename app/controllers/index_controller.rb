class IndexController < ApplicationController

  before_filter :authenticate_user!, only: [:welcome]
  def home

  end

  def welcome

  end

end
