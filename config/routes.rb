Rails.application.routes.draw do
  root to: 'home#index'

  resources :contacts, only: :create
end
