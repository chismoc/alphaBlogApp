Rails.application.routes.draw do
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
  get 'about', to: 'pages#about'
  get 'landing', to: 'pages#landing'

  #give only routes needed
  #resources :articles, only: [:show, :index, :new, :create, :edit, :update]

  #expose all the routes, Rest-ful routes
  resources :articles
end
