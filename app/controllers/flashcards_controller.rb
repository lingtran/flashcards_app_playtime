class FlashcardsController < ApplicationController
  def index
    @word = Dict.find(326)
  end
end
