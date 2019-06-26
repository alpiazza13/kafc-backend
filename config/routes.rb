Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:index]
      resources :teams, only: [:index]
      resources :players, only: [:index]
      resources :stats, only: [:index]
    end
  end
end
