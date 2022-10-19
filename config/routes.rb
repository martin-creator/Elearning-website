Rails.application.routes.draw do
  root 'pages#about'
  devise_for :users, :path => '', :path_names => { :sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
                      :controllers => {:omniauth_callbacks => "omniauth_callbacks"}

  get 'pages/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
