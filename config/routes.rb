Rails.application.routes.draw do
  root "recipes#index"
  resources :recipes, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: [:show]
  resources :users
  get "sessions/new"
  get   "/signup", to: "users#new"
  get   "/login",   to: "sessions#new"
  post  "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :recipes, only: [:index, :show]
    end
  end
end
