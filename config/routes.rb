Rails.application.routes.draw do
  
  root 'welcomes#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/signup' => 'students#new'
  post '/signup' => 'students#create'
  

  # resources :faculties, :students

  # resources :faculties do
  # 	resources :students
  # end 

  # resources :sessions, only: [:create, :new, :destroy]

  get '/officers/submissions/:id/phonescreen/new' => 'officers/submissions#new'
  post '/officers/submissions/:id' => 'officers/submissions#create'

    resources :courses, only: [:index, :show] do
    			resources :submissions, only: [:create, :new]
    end 

    namespace :officers do
      resources :submissions, only: [:index, :show, :edit, :update, :new, :create]
    end
    namespace :instructors, only: [:show] do
      resources :submissions, only: [:index, :show, :edit, :update]
    end
    namespace :students, only: [:show] do
      resources :submissions, only: [:index, :show]
    end




end 