class Question < ActiveRecord::Base
  has_many :deck_question_words
  has_many :words, through: :deck_question_words
  has_many :decks, through: :deck_question_words

  validates :name, presence: true

  enum focus_area: [:pinyin, :definition]
end
