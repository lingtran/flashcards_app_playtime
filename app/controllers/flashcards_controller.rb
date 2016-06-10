class FlashcardsController < ApplicationController
  def index
    deck_words = Deck.first.deck_words
    @last_deck_word = deck_words.last
    @deck_words_per_page = deck_words.paginate(:page => params[:page], :per_page => 1)
    # need solution to get rid of second instance var to view
  end
end
