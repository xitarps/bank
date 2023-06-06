require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  resources :accounts, except: %i[new create]
  resources :administrators
  resources :classrooms
  resources :contact_lists, only: %i[show] do
    resources :customers, only: %i[index]
    resources :customers, only: %i[destroy], controller: :contact_lists
  end
  resources :customer_classes
  resources :investments
  resources :products
  resources :taxes

  mount Sidekiq::Web => '/sidekiq'
end
