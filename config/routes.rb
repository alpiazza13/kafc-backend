Rails.application.routes.draw do
  get 'teams/index'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:index]
    end
  end
end
