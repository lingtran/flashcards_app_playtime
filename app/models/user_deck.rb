class UserDeck < ActiveRecord::Base
  has_many :study_sessions
  
  belongs_to :deck
  belongs_to :user
end
