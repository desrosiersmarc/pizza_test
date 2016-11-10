Rails.application.routes.draw do
  devise_for :users
  mount Attachinary::Engine => "/attachinary"
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pizzas, only: [:index, :new, :create] do
    resources :ingredients, only: [:index, :show]
  end
  resources :carts
  resources :food_trucks, only: [:index, :new, :create] do
    resources :open_days, only: [:index, :new, :create, :destroy]
  end
end
