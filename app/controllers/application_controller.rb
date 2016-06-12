class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :current_deck

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def current_deck
    @current_deck ||= Deck.find(params[:deck_id]).deck_question_words.where(deck_question_words: {question_id: 2})
  end
end
