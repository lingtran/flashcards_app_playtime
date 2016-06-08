class FlashcardsController < ApplicationController
  def index
    @word = Word.find(10)
  end
end
