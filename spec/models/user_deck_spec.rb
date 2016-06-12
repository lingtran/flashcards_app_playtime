require 'rails_helper'

RSpec.describe UserDeck, type: :model do
  context "associations" do
    it { is_expected.to belong_to(:deck) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:study_sessions) }
  end

  context "#weighted_average_score" do
    # create user
    # create study session
    # create user deck for each level
    # formula for weighted average...along the lines of (weight*score1, weight*score2)/(sum of weights)
    # StudySession (weight, score)
    # user_deck = UserDeck.find_by(user_id, deck_id)
    # user_deck.average_score =
      # study_session.select(:score).group(:weight)
  end
end
