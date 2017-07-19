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
    match "users/:id", to: "users#destroy", via: :delete, as: :admin_destroy_user
  end
  resources :users, only: [:index, :show]
end
