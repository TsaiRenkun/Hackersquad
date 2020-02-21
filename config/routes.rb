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
  get '/userprofiles/new' => 'userprofiles#new', as: 'new_userprofile'
  post '/userprofiles' => 'userprofiles#create'
  get '/userprofiles/:id' => 'userprofiles#show' , as: 'userprofile'
  get '/userprofiles/:id/edit' => 'userprofiles#edit', as: 'edit_userprofile'
  patch '/userprofiles/:id' => 'userprofiles#update'














#kun code start below
  post '/join' => 'attends#join'
  delete '/leave' => 'attends#leave'

  post '/join/group' => 'attends_groups#join'
  delete '/leave/group' => 'attends_groups#leave'


















end