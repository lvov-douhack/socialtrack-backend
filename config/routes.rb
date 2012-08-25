SocialtrackBackend::Application.routes.draw do
  devise_for :users

  root to: 'index#home'

  namespace :api do
    mount Devise::Oauth2Providable::Engine => '/oauth2'
  end
end
