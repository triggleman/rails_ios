Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/api" => "favorites#query"

  get "/users/validate", to: "users#validate"
  # get "/users", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout"  => "sessions#destroy"
  get "/users/:id/favorites" => "favorites#show"

  resources :users
  resources :favorites
end
