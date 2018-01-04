Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users' }
  devise_scope :user do
    get '/users/:id' => 'users#update'
  end
  root 'home#main'
  get '/boats' => 'boats#index'
  get '/boats/paddleboats' => 'boats#paddleboat_index'
  get '/boats/barges' => 'boats#barge_index'
  get '/parts' => 'parts#index'
  get '/checkout' => 'checkout#show'
  get '/checkout/confirm' => 'checkout#confirm'
  put '/products/:product_id/selected_options/:id' => 'options#update_selected'
  resources :users
  resources :options
  get '/shopping_cart' => 'shopping_carts#show'
  resources :products, only: [:create, :destroy, :update, :show, :index, :new]
  resources :base_models do
    resources :specifications
    post 'pictures' => 'base_models#upload_picture'
    delete 'pictures' => 'base_models#delete_picture'
  end
  resource :orders
  # TODO: nest orders under users - will that work with anonymous checkout?
end
