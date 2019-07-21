Rails.application.routes.draw do
  get 'topics/index'
  get 'topics/new'
  get 'sessions/new'
  get 'users/new'
  get 'pages/index'
  root 'pages#index'
  get 'pages/help'
  
  resources :users
  resources :topics

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  post '/favorites/:topic_id/destroy' => 'favorites#destroy', as: 'favorites_destroy'

  get '/comments/:topic_id/new' => 'comments#new', as: 'comments'
  post '/comments/:topic_id/create', to: 'comments#create', as: 'comments_create'
  
end
