
Rails.application.routes.draw do
  resources :credit_cards
  
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions'}
 
  devise_scope :user do
    get '/confirm_email/:token', to: 'registrations#confirm_email', as: 'confirm_email'
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root "products#home"

  resources :products

  resources :contacts

  resources :users do
    resources :addcarts
  end
    
  resources :checkout, only: [:create]

  post "checkout/create", to: "checkout#create", format: :js

  patch 'add_quantity/:id', to: 'addcarts#add_quantity', as: 'add_quantity'

  patch 'remove_quantity/:id', to: 'addcarts#remove_quantity', as: 'remove_quantity'

  get 'allcard', to: "addcarts#allcard"
  
  get 'home', to: 'products#home'

  get 'buy', to: 'products#buy'

  get 'about', to: 'products#about'

  put '/product/:id/like', to: 'products#like', as: 'like'


 
  get 'welcome', to: 'products#welcome'
end
