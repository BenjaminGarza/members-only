Rails.application.routes.draw do
  get '/signin', to: "sessions#new"
  post 'sessions/create'
  
end
