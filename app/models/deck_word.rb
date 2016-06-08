class DeckWord < ActiveRecord::Base
  belongs_to :deck
  belongs_to :word
end
