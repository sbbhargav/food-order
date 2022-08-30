Rails.application.routes.draw do
  resources :orders
  resources :food_stores do
    resources :food_items
  end
  resources :sessions, only: [:new, :create]
  resources :users, only: [:new, :create]

  delete "logout/", to: "sessions#destroy"
  get "/auth/:provider/callback", to: "sessions#omniauth"
  root "pages#welcome"
end


