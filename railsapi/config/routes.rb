Rails.application.routes.draw do
  resources :tasks
  devise_for :users
  namespace :api, defaults:{ format: :json } do
    namespace :v1 do
      resources :users, only: [:show, :create, :update, :destroy]
    end
  end
end
