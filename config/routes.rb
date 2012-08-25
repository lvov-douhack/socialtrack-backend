SocialtrackBackend::Application.routes.draw do
  devise_for :users

  root to: 'index#home'

  namespace :api do
    get '/me' => 'users#me'
  end
end
