class Deck < ActiveRecord::Base
  has_many :user_decks
  has_many :users, through: :user_decks
  
  validates :name, presence: true
end
