class DeckUserAnswer < ActiveRecord::Base
  belongs_to :deck_word_question_choice
  belongs_to :deck_word_question
  belongs_to :study_session
end
