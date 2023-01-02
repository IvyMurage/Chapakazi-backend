Rails.application.routes.draw do
  resources :admins
  resources :handymen do
    resources :reviews
  end
  resources :messages
  resources :customers
  resources :jobs, only: [:index, :show, :destroy, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
