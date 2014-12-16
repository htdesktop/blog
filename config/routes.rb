Rails.application.routes.draw do

  resources :posts 
  resources  :comments 

  root 'posts#index'
  
  get 'index' => 'users#index'
  get 'login' => 'users#login'
  get 'logout' => 'users#logout'
  get 'register' => 'users#register'
  post 'loginpost' => 'users#login_create'
  post 'registerpost' => 'users#register_create'

end
