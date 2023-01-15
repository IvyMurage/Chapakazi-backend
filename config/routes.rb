Rails.application.routes.draw do
  resources :admins
  resources :handymen
  resources :messages
  resources :reviews
  resources :customers
  resources :jobs, only: [:index, :show, :destroy, :create]

  post "handyman/login", to: "handymenauth#create"
  post "customer/login", to: "customersauth#create"
  patch "customer/password-reset", to: "customers#update"
  patch "handyman/password-reset", to: "handymen#update"
  patch "/reviews/:id/like", to: "reviews#increment_likes"
  patch "/reviews/:id/dislike", to: "reviews#decrement_likes"
  # patch "handymen/:id/image", to: "handymen#update_image"
end
