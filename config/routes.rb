Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :recipes do
    member do
      #post 'favorite'
    end
    collection do
      get 'search'
    end
  end
  resources :favorites, only: [:index, :create, :destroy]
  resources :cuisines, only: [:show, :new, :create]
  resources :recipe_types, only: [:show, :new, :create]
end
