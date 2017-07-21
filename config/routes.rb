Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users, controllers: {
    sessions: "sessions",
    registrations: "registrations"
  }

  devise_scope :user do
    get "/register", to: "registrations#new", as: :register
    get "/signin", to: "sessions#new", as: :signin
    delete "/signout", to: "sessions#destroy", as: :signout
    match "admin_delete/users/:id", to: "users#destroy", via: :delete
  end
  resources :users, only: [:index]
end
