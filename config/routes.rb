Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount Ckeditor::Engine => '/ckeditor'

  get 'auth/:provider/callback', to: 'sessions#create'
  get '/login', to: 'sessions#new'

  root 'home#show'
end
