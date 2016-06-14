class TalliesController < FlashcardsController
  before_filter :find_deck_word, on: [:create]
  helper_method :deck_word
  helper_method :first_deck_word?
  helper_method :next_word
  helper_method :last_deck_word?

  def create
    if first_deck_word?
      session[:tallied_score] = 0
      session[:tallied_score] += 1
      redirect_to flashcard_page_user_path(current_user, params[:deck_id], page: current_deck.index(next_word)+1)
    elsif last_deck_word?
      redirect_to study_sessions_path(params[:deck_word])
    else
      session[:tallied_score] += 1
      redirect_to flashcard_page_user_path(current_user, params[:deck_id], page: current_deck.index(next_word)+1)
    end
  end

  private
  def find_deck_word
    DeckQuestionWord.find(params[:deck_word].to_i)
  end

  def deck_word
    find_deck_word
  end

  def first_deck_word?
    deck_word == current_deck.first
  end

  def next_word
    DeckQuestionWord.find_next_for(current_deck, deck_word)
  end

  def last_deck_word?
    deck_word.id == current_deck.last.id
  end

end
