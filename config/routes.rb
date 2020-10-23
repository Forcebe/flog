Rails.application.routes.draw do
  #homepage route
  root :to => "pages#home"
  #new user routes
  resources :users, :only => [:new, :create,]

  #routes for logbooks & flights as a nested resource
  resources :logbooks do
    resources :flights
  end


  #log in/log out routes
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  # routes for user chart display
  get '/users/:id/by_month' => 'users#by_month', :as => :user_by_month
  get '/users/:id/by_aircraft' => 'users#by_aircraft', :as => :user_by_aircraft
  get '/users/:id/by_type' => 'users#by_type', :as => :user_by_type

  # routes for logbook chart display
  get 'logbooks/:id/by_month' => 'logbooks#by_month', :as => :logbook_by_month
  get 'logbooks/:id/by_aircraft' => 'logbooks#by_aircraft', :as => :logbook_by_aircraft

  #routes for asynchronous charts
  resources :charts, only: [] do
    collection do
      get 'user_hours_by_month'
      get 'user_hours_by_aircraft'
      get 'user_flights_by_type'
      get 'logbook_hours_by_month'
      get 'logbook_jumps_by_month'
      get 'logbook_hours_by_aircraft'
      get 'logbook_jumps_by_canopy'
    end
  end
end
