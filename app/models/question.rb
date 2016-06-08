class Question < ActiveRecord::Base
  has_many :deck_words
  has_many :words, through: :deck_words

  validates :name, presence: true
end
