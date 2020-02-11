Rails.application.routes.draw do
  devise_for :users
  get '/secret', to: 'pages#secret', as: :secret
  root to: 'pages#index'
end
