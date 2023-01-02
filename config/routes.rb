Rails.application.routes.draw do
  resources :admins
  resources :handymen do
    resources :reviews
  end
  resources :messages
  resources :reviews, only: [:index]
  resources :customers
  resources :jobs, only: [:index, :show, :destroy, :create]

  post "handyman/login", to: "handymenauth#create"
end
