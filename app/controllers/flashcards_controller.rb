class FlashcardsController < ApplicationController
  def index
    @word = Dict.find(1)
  end
end
