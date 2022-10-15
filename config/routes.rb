Rails.application.routes.draw do
  devise_for :users
  resources :recipes, only: [:index, :new, :create, :show, :destroy] do
    resources :recipe_foods, only: [:create, :destroy]
  end
  resources :inventories, only: [:index, :new, :create, :show, :destroy] do
    resources :inventory_foods, only: [:create, :destroy]
  end
  resources :foods, only: [:index, :new, :create, :destroy]

  get '/public_recipes', to: 'recipes#list_public'

  post '/shopping_list', to: 'recipes#shopping_list'

  root "recipes#list_public"
end
