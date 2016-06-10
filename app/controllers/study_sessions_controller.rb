class StudySessionsController < ApplicationController
  def create
    # need major refactor

    deck_word = DeckWord.find(params[:deck_word].to_i)
    deck = deck_word.deck
    last_deck_word = Deck.first.deck_words.last
    if deck_word.id == 1
      user_deck = UserDeck.create(deck_id: deck.id, user_id: current_user.id)
      study_session = StudySession.new(user_deck_id: user_deck.id)
      session[:tallied_score] = 0
      session[:tallied_score] += 1 if params[:choice] == deck_word.word.pinyin
      next_word = DeckWord.find_next_for(params[:deck_word].to_i)
      redirect_to flashcard_page_path(page: next_word.id)
    elsif deck_word.id == last_deck_word.id
      session[:tallied_score] += 1 if params[:choice] == deck_word.word.pinyin
      redirect_to flashcards_path
      flash[:score_popup] = "Your score is #{session[:tallied_score]}"
    else
      session[:tallied_score] += 1 if params[:choice] == deck_word.word.pinyin
      next_word = DeckWord.find_next_for(params[:deck_word].to_i)
      redirect_to flashcard_page_path(page: next_word.id)
    end
  end
end
