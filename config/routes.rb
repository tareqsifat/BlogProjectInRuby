Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post '/register', to: 'users#create'
  post '/login', to: 'users#login'
  get '/user-list', to: 'users#index'

end
