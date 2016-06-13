class UserDeck < ActiveRecord::Base
  # scope :found_deck, -> { where(deck_id: deck_id) }
  has_many :study_sessions

  belongs_to :deck
  belongs_to :user

  # set an after create or update call to update tier based on weighted score for user

  def weighted_score_over_time
    study_sessions.sum("score * weight")/study_sessions.sum("weight")
  end

  def self.weighted_score_across_users_over_time
    joins(:study_sessions).sum("score * weight")/joins(:study_sessions).sum("weight")
  end

  # def self.weighted_score_over_time_for_deck(deck_id)
  # test scope
  #   found_deck
  # end
# add method study rate per week

end
