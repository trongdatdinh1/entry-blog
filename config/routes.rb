Rails.application.routes.draw do
  root to: "static_pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/register", to: "users#new"
  resources :users
  resources :blogs
  resources :comments
  resources :relationships
end
