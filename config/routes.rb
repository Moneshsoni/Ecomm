Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions'}
 
  # devise_scope :user do
  #   get "confirm_email/:token" => "registrations#confirm_email"
  # end

  root "products#index"
  resources :products

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_scope :user do
    get '/confirm_email/:token', to: 'registrations#confirm_email', as: 'confirm_email'
  end


  get 'home', to: 'products#home'

  get 'welcome', to: 'products#welcome'

  # get 'confirm_email/:token', to: 'registrations#confirm_email', as: :confirm_email
  

end
