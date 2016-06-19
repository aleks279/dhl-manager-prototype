Rails.application.routes.draw do
  devise_for :drivers, controllers: { sessions: 'drivers/sessions', registrations: 'drivers/registrations' }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  resources :drivers
  resources :trucks
  resources :routes
  resources :clients

  root 'pages#choose_user_type'
end
