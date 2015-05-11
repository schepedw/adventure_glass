Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users' }
  devise_scope :user do
    get '/users/:id' => 'users#update'
  end
  root 'home#main'
  get '/boats/build' => 'boats#build'
  resources :boats
  get '/boats' => 'boats#index'
  get '/boats/:subject' => 'boats#show'
  resources :parts
  get '/parts' => 'parts#index'
  get '/parts/:id' => 'parts#show'
  get '/paddleboats' => 'paddleboats#index'
  get '/lifts' => 'lifts#show'
  get '/docks' => 'docks#show'
  get '/shopping_cart' => 'shopping_carts#show'
  get '/checkout' => 'checkout#show'
  get '/checkout/confirm' => 'checkout#confirm'
  resources :users#, only: [:create]
  resources :products
end
