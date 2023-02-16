Rails.application.routes.draw do
  get 'recipes/index'
  get 'recipes/show'
  get 'recipes/new'
  get 'recipes/create'
  get 'recipes/edit'
  get 'recipes/update'
  get 'recipes/destroy'
  devise_for :users

  # root 'foods#show'
  root 'foods#index'

  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :new, :create, :show, :destroy] do
    resources :recipe_foods, only: [:new, :create, :destroy, :update, :edit]
  end
  
end
