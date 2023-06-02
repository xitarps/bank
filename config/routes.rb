require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  resources :administrators
  resources :classrooms
  resources :contact_lists, only: %i[show] do
    resources :customers, only: %i[index]
    resources :customers, only: %i[destroy], controller: :contact_lists
  end
  resources :taxes

  mount Sidekiq::Web => '/sidekiq'
end
