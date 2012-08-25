module Api
  class UsersController < BaseController
    def me
      ActiveRecord::Base.include_root_in_json = false
      render json: current_user
    end
  end
end
