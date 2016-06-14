class DeckQuestionWord < ActiveRecord::Base
  belongs_to :question
  belongs_to :word
  belongs_to :deck

  enum is_correct: [:true, :false]
  enum level: [:novice, :badass_in_training, :master]

  def self.find_next_for(current_deck, deck_word)
    index_of_deck_word = current_deck.index(deck_word)

    if current_deck.last != deck_word
      next_index = index_of_deck_word + 1
    else
      next_index = index_of_deck_word
    end

    current_deck[next_index]
  end

  # test
  def pinyin
    word.pinyin
  end

  #test
  def simp
    word.simp
  end

  # test
  def definition
    word.definition
  end

# test
  def question_name
    question.name
  end
end
