Rails.application.routes.draw do
  
  resources "entries"
  resources "places"
  resources "sessions", only: [:new, :create, :destroy]
  resources "users"

  get "/login", to: "sessions#new", as: "login"
  get "/logout", to: "sessions#destroy", as: "logout"

  root to: "places#index"

end
