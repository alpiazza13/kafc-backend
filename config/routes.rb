Rails.application.routes.draw do
  devise_for :users, path: 'api/v1',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout'
             },

             controllers: {
               sessions: 'api/v1/sessions',
               unlocks: 'unlocks',
               confirmations: 'confirmations'
             }

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:index]
      resources :teams, only: [:index]
      resources :players, only: [:index]
      resources :stats, only: [:index]
      resources :positions, only: [:index]
      resources :matches, only: [:index]  
      resources :sessions, only: [:create]
    end
  end
end
