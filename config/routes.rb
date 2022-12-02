Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'project#index'
  devise_for :users, :path => '', :path_names => { :sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
                      :controllers => {:omniauth_callbacks => "omniauth_callbacks"}

  get 'pages/about'
  post '/free' => 'charge#free'

  resources :project do
    resources :task, only: [:show]
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
