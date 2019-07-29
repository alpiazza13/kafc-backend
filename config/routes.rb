Rails.application.routes.draw do

  devise_for :users
  # root to: 'dashboard#index'
  # root to: 'home#index'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:index]
      resources :teams, only: [:index]
      resources :players, only: [:index]
      resources :stats, only: [:index]
      resources :positions, only: [:index]
      resources :matches, only: [:index]
    end
  end
end
