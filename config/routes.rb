Rails.application.routes.draw do
  root "recipes#index"
  resources :recipes, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :users
  get   "/signup", to: "users#new"
  get   "/login",   to: "sessions#new"
  post  "/login",   to: "sessions#create"
end
