Rails.application.routes.draw do
  get 'flights/index'
  get 'flights/new'
  get 'flights/edit'
  #homepage route
  root :to => "pages#home"
  #new user routes
  resources :users, :only => [:new, :create]

  #routes for logbooks
  resources :logbooks
  
  #log in/log out routes
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
