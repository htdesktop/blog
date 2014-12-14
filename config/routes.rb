Rails.application.routes.draw do
  get 'home' => 'posts#home'
  get 'new'   => 'posts#new'
  post 'create' => 'posts#create'

  root 'posts#home'

end
