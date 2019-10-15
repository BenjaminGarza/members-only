Rails.application.routes.draw do
  get '/signin', to: "sessions#new"
  get '/users/:id', to: "users#show", as: "user"
  post '/signin', to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  
  root "sessions#new"

end
