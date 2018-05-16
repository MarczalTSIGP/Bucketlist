Rails.application.routes.draw do
  devise_for :admins
  root to: 'home#index'

  devise_for :users
  resources :contacts, only: [:create]

  authenticate :user do
    namespace :users do
      root to: 'dashboard#index'

      get 'lists/:id/share', to: "lists#share", as: :new_share_list
      post 'lists/:id/share', to: "lists#share_with", as: :share_list

      get 'auto-complete-search', to: "users#index", as: :autocomplete_search

      resources :lists, except: :index do
        patch 'tasks/:id/completed', to: 'tasks#completed', as: :mark_task_as_completed
        patch 'tasks/:id/uncompleted', to: 'tasks#uncompleted', as: :mark_task_as_uncompleted
        resources :tasks, except: :index
      end
    end
  end

  authenticate :admin do
    namespace :admins do
      root to: 'dashboard#index'
    end
  end
  
  mount ActionCable.server, at: '/cable'
end
