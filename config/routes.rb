Rails.application.routes.draw do
  get 'blog/index'
  get 'blog/show'
  post 'blog/create'
  put 'blog/update'
  delete 'blog/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post '/register', to: 'users#create'
  post '/login', to: 'users#login'
  get '/user-list', to: 'users#index'

  
  namespace :category do
    resources :category, only: [:index, :show, :create, :update, :destroy]
  end
  # get '/category', to: 'category#index'


end
