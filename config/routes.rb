Rails.application.routes.draw do
  devise_for :users
  root 'home#main'
  get '/boats/build' => 'boats#build'
  resources :boats
  get '/boats' => 'boats#index'
  get '/boats/:subject' => 'boats#show'
  get '/parts' => 'parts#index'
  get '/parts/:id' => 'parts#show'
  get '/paddleboats' => 'paddleboats#index'
  get '/lifts' => 'lifts#show'
  get '/docks' => 'docks#show'
  get '/shopping_cart' => 'shopping_carts#show'
  resources :products
  resources :parts
end
