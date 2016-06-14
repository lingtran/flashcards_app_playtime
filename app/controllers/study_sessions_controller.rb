class StudySessionsController < FlashcardsController
  before_action :find_deck_word, :first_deck_word?, :last_deck_word?, :answer_correct?, only: [:create]

  helper_method :deck_word,
                :next_word,
                :next_page

  def create
    if first_deck_word?
      session[:tallied_score] = 0
      session[:tallied_score] += 1 if answer_correct?

      redirect_to flashcard_page_user_path(current_user, params[:deck_id], page: next_page)
    elsif last_deck_word?
      session[:tallied_score] += 1 if answer_correct?

      Score.record(deck_word.deck, current_user, session[:tallied_score])

      redirect_to flashcard_user_path(current_user, params[:deck_id])

      flash[:score_popup] = "Your score is #{session[:tallied_score]}"
      flash[:encouragement] = "Have another go at it"
    else
      session[:tallied_score] += 1 if answer_correct?

      redirect_to flashcard_page_user_path(current_user, params[:deck_id], page: next_page)
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

    def answer_correct?
      params[:choice] == deck_word.pinyin
    end

    def last_deck_word?
      deck_word.id == current_deck.last.id
    end

    def next_word
      DeckQuestionWord.find_next_for(current_deck, deck_word)
    end

    def next_page
      current_deck.index(next_word)+1
    end
end
