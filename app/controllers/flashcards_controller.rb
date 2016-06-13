class FlashcardsController < ApplicationController
  helper_method :current_deck

  def index
    @decks = Deck.all.limit(7)
  end

  def show
    @deck_words_per_page = current_deck.paginate(:page => params[:page], :per_page => 1)
  end

  def current_deck
    @current_deck ||= DeckQuestionWord.where(question_id: params[:deck_id].to_i, deck_id: params[:deck_id].to_i).limit(7)
  end
end
