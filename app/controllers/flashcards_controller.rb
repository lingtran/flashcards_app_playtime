class FlashcardsController < ApplicationController
  helper_method :current_deck

  def index
    @decks = Deck.all
  end

  def show
    deck                 = current_deck
    @deck_words_per_page = deck.paginate(:page => params[:page], :per_page => 1)
  end

  def current_deck
    @current_deck ||= DeckQuestionWord.set_deck(params[:deck_id])
    return @current_deck
  end
end
