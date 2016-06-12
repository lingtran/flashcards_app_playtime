class UserDeck < ActiveRecord::Base
  has_many :study_sessions

  belongs_to :deck
  belongs_to :user

  def weighted_score_over_time
    study_sessions.sum("score * weight")/study_sessions.sum("weight")
  end

  def self.weighted_score_across_users_over_time
    joins(:study_sessions).sum("score * weight")/joins(:study_sessions).sum("weight")
  end
end
