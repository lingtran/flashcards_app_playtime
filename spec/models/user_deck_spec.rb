require 'rails_helper'

RSpec.describe UserDeck, type: :model do
  context "associations" do
    it { is_expected.to belong_to(:deck) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:study_sessions) }
  end

  context "#weighted_score_over_time" do
    it "can calculate the weighted average of a user deck over time" do
      user = create(:user)
      deck = create(:deck)
      user_deck = create(:user_deck, user_id: user.id, deck_id: deck.id)
      create_list(:study_session, 2, :badass_in_training_score_weight, user_deck_id: user_deck.id)
      create_list(:study_session, 2, user_deck_id: user_deck.id)
      create(:study_session, :master_score_weight, user_deck_id: user_deck.id)


      avg_score = user_deck.weighted_score_over_time

      expect(avg_score).to eq(5)
    end
  end
end
