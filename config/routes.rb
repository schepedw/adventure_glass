Rails.application.routes.draw do
  root 'home#main'
    get 'boats/build' => 'boats#build'
    get 'boats/index' => 'boats#index'
end
