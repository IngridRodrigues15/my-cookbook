Rails.application.routes.draw do
  root to: 'home#index'
  resources :recipe
  #resources :recipe, only: [:show, :new, :create]
end
