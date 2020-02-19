Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #zk code start below
  root 'events#index'
  get '/events/new' => 'events#new', as: 'new_event'
  post '/events' => 'events#create'
  get '/events/:id' => 'events#show' , as: 'event'
  get '/events/:id/edit' => 'events#edit', as: 'edit_event'
  patch '/events/:id' => 'events#update'





















#safs code start below



















#kun code start below




















end