class FlashcardsController < ApplicationController
  def index
    @decks = Deck.all
  end

  def show
    @deck_words_per_page = current_deck.paginate(:page => params[:page], :per_page => 1)
  end


end
