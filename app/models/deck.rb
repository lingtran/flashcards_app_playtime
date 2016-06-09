class Deck < ActiveRecord::Base
  has_many :user_decks
  has_many :users, through: :user_decks
  has_many :deck_words
  has_many :words, through: :deck_words

  validates :name, presence: true
end
