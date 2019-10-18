# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts, only: [:create, :new, :index]
  get '/signin', to: 'sessions#new'
  get '/users/:id', to: 'users#show', as: 'user'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root 'sessions#new'
end
