Rails.application.routes.draw do
  
  root 'welcomes#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/signup' => 'students#new'
  post '/signup' => 'students#create'

  # get '/officers/submissions/:id/phonescreen/new' => 'officers/submissions#new'
  # post '/officers/submissions/:id' => 'officers/submissions#create'

  # get '/instructors/submissions/:id/interview/new' => 'instructors/submissions#new'
  # post '/instructors/submissions/:id' => 'instructors/submissions#create'


    resources :courses, only: [:index, :show] do
    			resources :submissions, only: [:create, :new]
    end 

    namespace :officers do

      resources :submissions, only: [:index, :show, :new, :create] do
        resources :phonescreens, only: [:new, :create]
      end
    end

    namespace :instructors do

      
      resources :submissions, only: [:index, :show, :new, :create] do
        resources :interviews, only: [:new, :create, :show]
      end 
    end

    namespace :students do

      
      resources :submissions, only: [:index, :show]
    end


end 