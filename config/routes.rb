Rails.application.routes.draw do
  
  root 'welcomes#index'

  get '/login' => 'sessions#new'

  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  resources :faculties, :students

  resources :faculties do
  	resources :students
  end 

end 