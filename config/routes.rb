SocialtrackBackend::Application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  root to: 'index#home'
  get '/token', to: 'index#token'
  get '/stats', to: 'index#stats'

  namespace :api do
    get '/' => 'index#get'
    post '/' => 'index#post'
    get '/me' => 'index#me'
  end
end
