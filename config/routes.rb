Rails.application.routes.draw do
  
  root 'welcomes#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/signup' => 'students#new'
  post '/signup' => 'students#create'
  
  resources :faculties, :students

  resources :faculties do
  	resources :students
  end 

  resources :sessions, only: [:create, :new, :destroy]
  resources :courses do
  			resources :submissions, only: [:create, :new]
  end 



end 