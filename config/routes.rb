Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions'}
  root "products#index"
  resources :products

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users

  get 'home', to: 'products#home'

  get 'confirm_email/:token', to: 'users#confirm_email', as: :confirm_email
end
