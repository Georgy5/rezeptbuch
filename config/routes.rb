Rails.application.routes.draw do
  get 'reviews/new'
  get "sessions/new"
  root "recipes#index"
  resources :recipes, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :users
  get   "/signup", to: "users#new"
  get   "/login",   to: "sessions#new"
  post  "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
end
