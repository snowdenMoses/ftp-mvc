Rails.application.routes.draw do
  get 'user_registraions/new'
  get 'user_registraions/create'
  get 'user_registraions/update'
  get 'user_registraions/edit'
  devise_for :users, :controllers => {:user_registrations => "user_registrations"}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  # authenticated :user do
  #   root to: "admin#index", as: :admin_root
  # end
  # root  to: "admin#index", as: :admin_root, :constraints => lambda { |request| request.env['warden'].user&.roles&.map(&:title)&.include?("admin") }
  root  to: "admin_analytics#index", as: :admin_root, :constraints => lambda { |request| request.env['warden'].user&.roles&.map(&:title)&.include?("admin") }
  root  to: "home#index", as: :home_root

  resources :personal_details, only: [:index, :show, :edit, :update]
  resources :categories
  resources :admin_analytics, only: %i[index]
  get 'personal_details/index'
  resources :products
  resources :users, only: [:index, :show, :edit, :update]
  resources :user_registration, only: [:new, :create]
end
