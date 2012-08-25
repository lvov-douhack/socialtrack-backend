SocialtrackBackend::Application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  root to: 'index#home'
  get '/token', to: 'index#token'

  namespace :api do
    get '/me' => 'users#me'
  end
end
