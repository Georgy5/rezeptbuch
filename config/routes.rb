Rails.application.routes.draw do
  get 'users/new'
  root "recipes#index"
  resources :recipes, only: [:index, :show, :new, :create, :edit, :update, :destroy]
end
