class UserDeck < ActiveRecord::Base
  has_many :study_sessions

  belongs_to :deck
  belongs_to :user


  def weighted_score_over_time
    study_sessions.sum("score * weight")/study_sessions.sum("weight")
  end
end
