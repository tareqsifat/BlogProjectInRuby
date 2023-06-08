Rails.application.routes.draw do
  #subCategory Routes
  get 'sub_category/index'
  post 'sub_category/create'
  put 'sub_category/update'
  get 'sub_category/show'
  delete 'sub_category/delete'


  #BlogRoutes
  get 'blog/index'
  get 'blog/show/:id', to: 'blog#show'
  post 'blog/create'
  put 'blog/update/:id', to: 'blog#update'
  delete 'blog/destroy/:id', to: 'blog#destroy'
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
