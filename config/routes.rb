require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  mount Sidekiq::Web => '/sidekiq'
end
