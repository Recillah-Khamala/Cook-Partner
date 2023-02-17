Rails.application.routes.draw do
  devise_for :users

  root 'foods#index'
  # root 'public_recipes#index'

  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :new, :create, :show, :destroy] do
    resources :recipe_foods, only: [:new, :create, :destroy]
  end
  
  get 'public_recipes', to: 'recipes#public_recipes'

  resources :public_recipes, only: [:index]
end
