Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users' }
  devise_scope :user do
    get '/users/:id' => 'users#update'
  end
  root 'home#main'
  get '/boats/build' => 'boats#build' #TODO: I don't like this, or this page really...
  get '/boats/paddleboats' => 'boats#paddleboat_index'
  get '/boats' => 'boats#index'
  get '/parts' => 'parts#index'
  get '/parts/:id' => 'parts#show' #TODO: remove?
  get '/lifts' => 'lifts#show'
  get '/docks' => 'docks#show'
  get '/shopping_cart' => 'shopping_carts#show'
  resources :shopping_carts, only: [:create, :show, :update] do
    resources :products, only: [:show, :update]
  end
  get '/checkout' => 'checkout#show'
  get '/checkout/confirm' => 'checkout#confirm'
  resources :users#, only: [:create]
  resources :boats
  resources :options
  resources :products do
    resources :specifications
    post 'pictures' => 'products#upload_picture'
    delete 'pictures' => 'products#delete_picture'
  end
  resources :orders
  #TODO: nest specifications under products
  #TODO: nest orders under users - will that work with anonymous checkout?
end
