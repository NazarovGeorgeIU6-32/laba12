Rails.application.routes.draw do
  resources :users
    
  root to: 'sessions#new'
  
  post '/sessions', to: 'sessions#create', as: 'sessions'
  get '/sign_up', to: 'users#new', as: 'sign_up'
  delete '/log_out', to: 'sessions#destroy', as: 'log_out'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end