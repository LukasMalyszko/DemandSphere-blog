Rails.application.routes.draw do
  get 'auth/index'
  get 'auth/home'
  get '/signup', to: 'auth#signup'
  # get '/get_articles/:num', to: 'articles#get_articles'



  root "auth#index"

  get "/home", to: "auth#home"

  post "/login", to: "auth#login"
  post "/signup", to: "auth#signup"
  post "/logout", to: "auth#logout"

  # require 'sidekiq/web'
  # require 'sidekiq/crone/web'
  # mount Sidekiq::WEB => '/sidekiq'

  # resources :articles, only: [:index]


  # get "/articles", to: "articles#get_articles "
end
