Rails.application.routes.draw do
  
  root 'welcomes#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :students, as: 'signup', only: [:new, :create]
  
  # resources :faculties, :students

  # resources :faculties do
  # 	resources :students
  # end 

  # resources :sessions, only: [:create, :new, :destroy]
    resources :courses, only: [:index, :show] do
    			resources :submissions, only: [:create, :new]
    end 

    namespace :officers do
      root 'welcomes#officers'
      resources :submissions, only: [:index, :show, :edit, :update]
    end
    namespace :instructors, only: [:show] do
      resources :submissions, only: [:index, :show, :edit, :update]
    end
    namespace :students, only: [:show] do
      resources :submissions, only: [:index, :show]
    end



end 