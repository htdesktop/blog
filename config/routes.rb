Rails.application.routes.draw do
  get 'home' => 'posts#home'
  get 'new'   => 'posts#new'
  post 'create' => 'posts#create'


  get 'newcomment' => 'comments#new'
  post 'createComment' => 'comments#create'

  root 'posts#home'

end
