Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :path => "", :path_name => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
             :controllers => {:omniauth_callbacks => "omniauth_callbacks"}
  get 'pages/about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'pages#about'  #This becomes the landing page for our website

  # Defines the root path route ("/")
  # root "articles#index"
end
