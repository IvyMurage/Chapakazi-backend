Rails.application.routes.draw do
  resources :admins
  resources :handymen
  resources :messages
  resources :reviews
  resources :customers
  resources :jobs, only: [:index, :show, :destroy, :create]

  post "handyman/login", to: "handymenauth#create"
  post "customer/login", to: "customersauth#create"
end
