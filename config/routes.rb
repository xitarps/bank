require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :contact_lists, only: %i[show] do
    resources :customers, only: %i[index]
    resources :customers, only: %i[destroy], controller: :contact_lists
  end
  mount Sidekiq::Web => '/sidekiq'

  resources :taxes
end
