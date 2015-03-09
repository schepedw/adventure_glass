Rails.application.routes.draw do
  root 'home#main'
  get 'boats/build' => 'boats#build'
  get 'boats' => 'boats#index'
  get 'gallery' => 'galleries#all'
  get 'boats/:subject' => 'boats#show'
end
