class Word < ActiveRecord::Base
  has_many :deck_question_words
  has_many :decks, through: :deck_question_words

  validates :trad, presence: true
  validates :simp, presence: true
  validates :pinyin, presence: true
  validates :definition, presence: true
end
