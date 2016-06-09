class FlashcardsController < ApplicationController
  def index
    @deck_words = Deck.first.deck_words
  end
end
