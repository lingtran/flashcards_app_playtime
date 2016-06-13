Rails.application.routes.draw do
  root "home#index"

  resources :user, only: [:show] do
    member do
      get '/flashcards', to: "flashcards#index", as: :flashcards
      get '/flashcards/:deck_id', to: 'flashcards#show', as: :flashcard
      resources :study_sessions, only: [:create]
      get '/flashcards/:deck_id/card=:page', to: "flashcards#show", as: :flashcard_page
    end
  end

  get '/auth/facebook', as: :facebook_login
  get '/auth/failure', to: redirect('/')
  get '/auth/facebook/callback', to: "sessions#create"
  delete '/logout', to: "sessions#destroy", as: :logout
end
