Rails.application.routes.draw do
  devise_for :drivers
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  root 'pages#choose_user_type'
end
