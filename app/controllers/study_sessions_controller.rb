class StudySessionsController < ApplicationController
  def create
    # need major refactor
    deck_word = DeckQuestionWord.find(params[:deck_word].to_i)
    answer_correct = params[:choice] == deck_word.word.pinyin
    last_deck_word = current_deck.last
    next_word = DeckQuestionWord.find_next_for(current_deck, deck_word)

    if deck_word == current_deck.first
      session[:tallied_score] = 0
      session[:tallied_score] += 1 if answer_correct

      redirect_to flashcard_page_user_path(current_user, page: next_word.id)
    elsif deck_word.id == last_deck_word.id
      session[:tallied_score] += 1 if answer_correct

      redirect_to flashcards_user_path(current_user)

      flash[:score_popup] = "Your score is #{session[:tallied_score]}"
      flash[:encouragement] = "Have another go at it"
    else
      session[:tallied_score] += 1 if answer_correct
      redirect_to flashcard_page_user_path(current_user, page: next_word.id)
    end
  end
end
