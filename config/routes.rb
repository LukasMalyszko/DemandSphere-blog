Rails.application.routes.draw do
  get 'auth/index'
  get 'auth/home'
  get '/signup', to: 'auth#signup'



  root "auth#index"

  get "/home", to: "auth#home"

  post "/login", to: "auth#login"
  post "/signup", to: "auth#signup"
  post "/logout", to: "auth#logout"

  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  mount Sidekiq::Web => '/sidekiq'

end
