Rails.application.routes.draw do
  devise_for :users

  resources :services do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, except: [:new, :create]

  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :pets
end
