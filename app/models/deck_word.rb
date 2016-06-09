class DeckWord < ActiveRecord::Base
  belongs_to :deck
  belongs_to :word
  belongs_to :question

  def self.find_next_for(deck_word)
    current_id = deck_word.id

    if DeckWord.last != deck_word
      next_id = deck_word.id  + 1
    else
      next_id = current_id
    end
    
    find(next_id)
  end
end
