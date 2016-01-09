Rails.application.routes.draw do

  get 'albums/index'

  get 'albums/show'

  devise_for :users

  root 'pages#home'

  get 'tracks' => 'tracks#index'
  post 'tracks' => 'tracks#create'
  get 'tracks/:id' => 'tracks#show'
  get 'tracks/:id/edit' => 'tracks#edit'
  patch 'tracks/:id' => 'tracks#update'
  delete 'tracks/:id' => 'tracks#destroy'

  get 'albums' => 'albums#index'
  get 'albums/:id' => 'albums#show'

  ## Pages actions
  get 'pages/welcome' => 'pages#welcome'
  get 'pages/home' => 'pages#home'
  get 'pages/upload' => 'pages#upload'

end
