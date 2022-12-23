Rails.application.routes.draw do
  resources :admins
  resources :handymen
  resources :messages
  resources :reviews
  resources :customers
  resources :jobs, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
