Rails.application.routes.draw do
  devise_for :users
  mount Attachinary::Engine => "/attachinary"
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pizzas do
    resources :ingredients, only: [:index, :show]
  end
  resources :carts
  resources :food_trucks do
    resources :open_days, only: [:index, :new, :create]
  end
end
