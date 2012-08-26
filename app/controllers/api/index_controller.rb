module Api
  class IndexController < BaseController
    include Devise::Controllers::Helpers

    skip_before_filter :verify_authenticity_token
    before_filter :authorize_by_token!

    def get
      render json: {stats: current_user.stats_for(1.day.ago)}
    end

    def post
      params[:stats].each do |stat|
        current_user.stat_records.create!(networkname: stat[:name], seconds: stat[:seconds], created_at: Time.at(params[:timestamp]).to_datetime)
      end
      render json: {}, status: :created
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
