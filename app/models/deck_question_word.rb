class DeckQuestionWord < ActiveRecord::Base
  belongs_to :question
  belongs_to :word
  belongs_to :deck

  enum is_correct: [:true, :false]
  enum level: [:novice, :badass_in_training, :master]

  def self.set_deck(deck_id)
    where(deck_id: deck_id.to_i).order("RANDOM()").limit(7)
  end

  def self.find_next_for(current_deck, deck_word)
    index_of_deck_word = current_deck.index(deck_word)

    if current_deck.last != deck_word
      next_index = index_of_deck_word + 1
    else
      next_index = index_of_deck_word
    end

    current_deck[next_index]
  end

  def self.shuffle_deck(current_deck, deck_id)
    current_deck.replace(DeckQuestionWord.set_deck(deck_id))
  end

  def pinyin
    word.pinyin
  end

  def simp
    word.simp
  end

  def definition
    word.definition
  end

  def question_name
    question.name
  end

end
