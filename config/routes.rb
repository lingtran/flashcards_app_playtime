Rails.application.routes.draw do
  root "home#index"

  resources :flashcards, only: [:index]
  resources :study_sessions, only: [:create]

  get '/auth/facebook', as: :facebook_login
  get '/auth/failure', to: redirect('/')
  get '/auth/facebook/callback', to: "sessions#create"
  delete '/logout', to: "sessions#destroy", as: :logout
end
