Rails.application.routes.draw do

  resources :posts do

    resources  :comments
    
  end
  
  resources :users 

  resources :sessions, :only => [:new, :create, :destroy]

  namespace :admin do
    
    resources :sessions, :only => [:new, :create, :destroy]

    root 'sessions#new'

    resources :posts

    resources :users

    resources :comments
  
  end

  root 'posts#index'
  
end
