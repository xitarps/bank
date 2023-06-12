require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  resources :accounts, except: %i[new create edit update]
  resources :administrators
  resources :classrooms
  resources :contact_lists, only: %i[show] do
    resources :customers, only: %i[index]
    resources :customers, only: %i[destroy], controller: :contact_lists
  end
  resources :deposits, only: %i[new create]
  resources :investments
  resources :products
  resources :taxes
  resources :transfers, only: %i[index show new create]

  mount Sidekiq::Web => '/sidekiq'
end
