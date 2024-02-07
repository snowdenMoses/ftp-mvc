Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "user_registrations" }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  # authenticated :user do
  #   root to: "admin#index", as: :admin_root
  # end
  # root  to: "admin#index", as: :admin_root, :constraints => lambda { |request| request.env['warden'].user&.roles&.map(&:title)&.include?("admin") }
  root to: "admin_analytics#index", as: :admin_root, :constraints => lambda { |request| request.env['warden'].user&.roles&.map(&:title)&.include?("admin") }
  root to: "home#index", as: :home_root

  resources :personal_details, only: [:index, :show, :edit, :update]
  resources :categories
  resources :admin_analytics, only: %i[index]
  get 'personal_details/index'
  resources :products do
    resources :comments, module: :products
  end
  resources :users, only: [:index, :show, :edit, :update]
  resources :user_registrations, only: [:new, :create]
  resources :favourites, only: [:index, :create, :destroy]
  resources :dashboard, only: :index
  resources :profile_information, only: :index
  namespace :customers do
    resources :categories
    resources :products
    resources :analytics, only: :index
  end
  namespace :vendors do
    resources :products
    resources :favourites
    resources :analytics, only: :index
  end
end
