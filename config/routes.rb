Rails.application.routes.draw do
  root "home#index"

  resources :user, only: [:show] do
    member do
      get '/flashcards', to: "flashcards#index", as: :flashcards
      resources :study_sessions, only: [:create]
      get '/flashcards/card=:page', to: "flashcards#index", as: :flashcard_page
    end
  end

  get '/auth/facebook', as: :facebook_login
  get '/auth/failure', to: redirect('/')
  get '/auth/facebook/callback', to: "sessions#create"
  delete '/logout', to: "sessions#destroy", as: :logout

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      namespace :study_sessions do
        resources :scores, only: [:create]
      end
    end
  end
end
