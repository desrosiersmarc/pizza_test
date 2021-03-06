Rails.application.routes.draw do
  devise_for :users
  mount Attachinary::Engine => "/attachinary"

  scope '(:locale)', locale: /en/ do
    root to: 'pages#home'
    get '/api', to: 'pages#api'
    get '/registration', to: 'pages#registration'
    get '/company', to: 'pages#company'
    get '/my_foodtrucks', to: 'pages#my_foodtrucks'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :pages, only: [:index, :show]
    resources :carts
    resources :food_trucks, only: [:index, :new, :create, :edit] do
      resources :open_days, only: [:index, :new, :create, :destroy]
      resources :pizzas, only: [:index, :new, :create] do
        resources :ingredients, only: [:index, :show]
      end
    end
  end
end
