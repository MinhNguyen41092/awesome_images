Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users, controllers: {
    sessions: "sessions",
    registrations: "registrations"
  }

  devise_scope :user do
    get "/register", to: "registrations#new", as: :register
    get "/signin", to: "sessions#new", as: :signin
    delete "/cancel", to: "registrations#destroy", as: :cancel
  end
  resources :users, only: [:index, :show]
end
