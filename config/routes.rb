Rails.application.routes.draw do
  
  root 'welcomes#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/login' => 'sessions#destroy'

  resources :sessions, only: [:create, :new, :destroy]
  resources :courses do
  			resources :submissions, only: [:create, :new]

  end

end 