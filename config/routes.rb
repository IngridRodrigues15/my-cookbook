Rails.application.routes.draw do
  root to: 'home#index'
  get '/search', to: 'recipes#search'
  get '/search/:q', to: 'recipes#search'
  resources :recipes, only: [:show, :new, :create, :edit, :update]
  resources :cuisines, only: [:show, :new, :create]
  resources :recipe_types, only: [:show, :new, :create]
end
