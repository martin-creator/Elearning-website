Rails.application.routes.draw do
  devise_for :users
  get 'pages/about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'pages#about'  #This becomes the landing page for our website

  # Defines the root path route ("/")
  # root "articles#index"
end
