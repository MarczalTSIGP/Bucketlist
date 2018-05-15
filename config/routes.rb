Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users
  resources :contacts, only: [:create]

  authenticate :user do
    namespace :users do
      root to: 'dashboard#index'
    end
  end
end
