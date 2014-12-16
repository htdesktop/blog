Rails.application.routes.draw do
  get 'home' => 'posts#home'
  get 'new'   => 'posts#new'
  post 'create' => 'posts#create'
  get 'show' => 'posts#show'


  get 'newcomment' => 'comments#new'
  post 'createComment' => 'comments#create'
  get 'showcomment' => 'comments#show'

  get 'index' => 'users#index'
  get 'login' => 'users#login'
  get 'logout' => 'users#logout'
  get 'register' => 'users#register'
  post 'loginpost' => 'users#login_create'
  post 'registerpost' => 'users#register_create'

  root 'posts#home'

end
