class FlashcardsController < ApplicationController
  def index
    @word = Word.all.sample
  end
end
