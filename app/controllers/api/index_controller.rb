module Api
  class IndexController < BaseController
    include Devise::Controllers::Helpers

    before_filter :authorize_by_token!

    def get
      render json: {stats: current_user.stats_for(1.day.ago)}
    end

    def post
      render json: {}
    end

    def me
      render json: {user: {email: current_user.email}}
    end

    private

    def authorize_by_token!
      user = User.where(token: params[:token]).first
      if user
        sign_in(user)
      else
        render json: {}, status: 401
      end
    end
  end
end
