Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users' }
  devise_scope :user do
    get '/users/:id' => 'users#update'
  end
  root 'home#main'
  get '/boats/build' => 'boats#build' #TODO: I don't like this, or this page really...
  get '/boats/paddleboats' => 'boats#paddleboat_index'
  get '/parts' => 'parts#index'
  get '/lifts' => 'lifts#show'
  get '/docks' => 'docks#show'
  get '/shopping_cart' => 'shopping_carts#show'
  resources :shopping_carts, only: [:show, :update] do
    resources :products, shallow: true
  end
  get '/checkout' => 'checkout#show'
  get '/checkout/confirm' => 'checkout#confirm'
  resources :users
  resources :boats
  resources :options
  resources :base_models do
    resources :specifications
    post 'pictures' => 'base_models#upload_picture'
    delete 'pictures' => 'base_models#delete_picture'
  end
  resources :orders
  #TODO: nest orders under users - will that work with anonymous checkout?
end
