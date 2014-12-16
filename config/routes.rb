Rails.application.routes.draw do

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  resources :posts 
  resources  :comments
  resources :users 

  resources :sessions, :only => [:new, :create, :destroy]

  root 'posts#index'
  
end
