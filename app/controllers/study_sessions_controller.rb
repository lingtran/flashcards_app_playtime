class StudySessionsController < FlashcardsController
  before_action :find_deck_word,
                :first_deck_word?,
                :last_deck_word?, only: [:create]

  def create
    if first_deck_word?
      set_tally
      answer_correct?

      redirect_to flashcard_page_user_path(current_user, params[:deck_id], page: next_page)
    elsif last_deck_word?
      answer_correct?
      process_score

      flash[:score_popup] = "Your score is #{session[:tallied_score]}"
      flash[:encouragement] = "Have another go at it"

      redirect_to flashcard_user_path(current_user, params[:deck_id])
    else
      answer_correct?
      
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

    def last_deck_word?
      deck_word.id == current_deck.last.id
    end

    def next_word
      DeckQuestionWord.find_next_for(current_deck, deck_word)
    end

    def next_page
      current_deck.index(next_word)+1
    end

    def start_scoring
      Score.new
    end

    def set_tally
      session[:tallied_score] = 0
    end

    def answer_correct?
      session[:tallied_score] += 1 if params[:choice] == deck_word.pinyin
    end

    def process_score
      ScoreConversion.process(deck_word.deck, current_user, session[:tallied_score])
    end
end
