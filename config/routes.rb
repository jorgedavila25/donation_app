Rails.application.routes.draw do
  devise_for :users
  root to: "donations#index"

  resources :donations
end
