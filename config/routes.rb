Rails.application.routes.draw do
  get '/', to: 'sessions#welcome', as: 'root'
  resources :users, only: [:new, :create]
  resources :guests, only: [:index, :show]
  resources :episodes, only: [:index, :show]
  resources :appearances, only: [:index, :show, :new, :create]
  get '/sessions', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
