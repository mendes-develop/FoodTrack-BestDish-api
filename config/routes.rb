Rails.application.routes.draw do
  # resources :favorites
  # resources :votes
  # resources :dishes
  # resources :restaurants
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/login', to: 'auth#login'
  post '/signup', to: 'users#create'
  get '/profile', to: 'users#profile'
  post '/favorites', to: 'favorites#create'
  get '/favorites', to: 'favorites#show'
  get '/restaurants', to: 'restaurants#index'
  post '/votes', to: 'votes#create'
  delete 'favorites/:id', to: 'favorites#destroy'
  

end
