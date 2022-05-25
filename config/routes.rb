Rails.application.routes.draw do
  resources :items, only: [:index, :show, :create, :update, :destroy]
  resources :users, only: [:index, :show, :create, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
  # Defines the root path route ("/")
  # root "articles#index"
end
