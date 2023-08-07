Rails.application.routes.draw do
  root "products#index"
  resources :products

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions'}

  get 'home', to: 'products#home'
end