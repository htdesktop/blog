Rails.application.routes.draw do

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  resources :posts 

  get 'userpost' => 'posts#list'

  resources  :comments
  
  resources :users 

  resources :sessions, :only => [:new, :create, :destroy]

  namespace :admin do
    
    resources :sessions, :only => [:new, :create, :destroy]

    match '/signin', to: 'sessions#new', via: 'get'

    resources :posts
  
  end

  root 'posts#index'
  
end
