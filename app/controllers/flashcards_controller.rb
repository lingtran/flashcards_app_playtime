class FlashcardsController < ApplicationController
  def index
    @word = Word.find(1)
  end
end
