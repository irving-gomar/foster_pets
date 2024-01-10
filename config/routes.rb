Rails.application.routes.draw do
  devise_for :users
  resources :services do
  end
end
