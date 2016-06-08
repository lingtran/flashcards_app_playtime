class DeckWordQuestion < ActiveRecord::Base
  belongs_to :deck_word
  belongs_to :question
end
