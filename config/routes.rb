Rails.application.routes.draw do
  #homepage route
  root :to => "pages#home"
  #new user routes
  resources :users, :only => [:new, :create]

  #log in/log out routes
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
