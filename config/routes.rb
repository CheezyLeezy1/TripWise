# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  get '/countries', to: 'countries#show'

  resources :countries do
    resources :cities do
      resources :activities  # Nest activities within cities
    end
  end
end
