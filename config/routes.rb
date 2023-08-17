
Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions'}
 
  devise_scope :user do
    get '/confirm_email/:token', to: 'registrations#confirm_email', as: 'confirm_email'
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root "products#home"

  resources :products

  resources :products do
    resources :addcarts
  end

  get 'home', to: 'products#home'

  get 'welcome', to: 'products#welcome'
end
