class StudySessionsController < ApplicationController
  def create
    # if choice == right choice
      #  localStorage +1
    # else
    #   nothing
    # end
    binding.pry
    redirect_to flashcards_path
    # redirect to next question path?, find next deck_word = DeckWord.find_next_for(current_deck_word), which should be passed into this controller as a parameter

    # params[:deck_word] = DeckWord object; params[:choice] = selected answer
  end
end
