Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :recipes, only: [:show, :new, :create, :edit, :update, :destroy] do
    member do
      #post 'favorite'
    end
    collection do
      get 'search'
    end
  end
  resources :favorites, only: [:index, :create]
  resources :cuisines, only: [:show, :new, :create]
  resources :recipe_types, only: [:show, :new, :create]
end
