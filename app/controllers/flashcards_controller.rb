class FlashcardsController < ApplicationController
  def index
    @decks = Deck.all
  end

  def show
    binding.pry
    current_deck = Deck.
    @deck_words_per_page = current_deck.paginate(:page => params[:page], :per_page => 1)
  end

  # @current_deck ||= DeckQuestionWord.where(question_id: 1).limit(7)
# params[:deck_id], params[:id]
end
