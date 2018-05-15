Rails.application.routes.draw do
  devise_for :admins
  root to: 'home#index'

  devise_for :users
  resources :contacts, only: [:create]

  authenticate :user do
    namespace :users do
      root to: 'dashboard#index'
      resources :lists, except: :index
    end
  end

  authenticate :admin do
    namespace :admins do
      root to: 'dashboard#index'
    end
  end
end
