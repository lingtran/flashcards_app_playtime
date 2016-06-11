class FlashcardsController < ApplicationController
  def index
    @deck_words_per_page = current_deck.paginate(:page => params[:page], :per_page => 1)
  end
end
