# frozen_string_literal: true

Rails.application.routes.draw do
  get 'posts/new'
  post 'posts/', to: 'posts#create'
  get '/posts', to: 'posts#index'

  get '/signin', to: 'sessions#new'
  get '/users/:id', to: 'users#show', as: 'user'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root 'sessions#new'
end
