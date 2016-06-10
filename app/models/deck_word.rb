class DeckWord < ActiveRecord::Base
  belongs_to :deck
  belongs_to :word
  belongs_to :question

  def self.find_next_for(deck_word_id)
    if DeckWord.last.id != deck_word_id
      next_id = deck_word_id  + 1
    else
      next_id = deck_word_id
    end

    find(next_id)
  end
end
