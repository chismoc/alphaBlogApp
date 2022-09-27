Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
  get 'about', to: 'pages#about'
  get 'landing', to: 'pages#landing'
  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'

  #give only routes needed
  #resources :articles, only: [:show, :index, :new, :create, :edit, :update]

  #expose all the routes, Rest-ful routes
  resources :articles
  resources :users, except:[:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
end
