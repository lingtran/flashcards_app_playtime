require 'rails_helper'

RSpec.describe UserDeck, type: :model do
  context "associations" do
    it { is_expected.to belong_to(:deck) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:study_sessions) }
  end

  context "#weighted_score_over_time" do
    before(:each) do
      first_user, second_user = create_list(:user, 2)
      deck = create(:deck)
      @first_user_deck = create(:user_deck, user_id: first_user.id, deck_id: deck.id)
      @second_user_deck = create(:user_deck, user_id: second_user.id, deck_id: deck.id)

      5.times do
        create(:study_session, :badass_in_training_score_weight, user_deck_id: @first_user_deck.id)
        create(:study_session, user_deck_id: @second_user_deck.id)
        create(:study_session, :master_score_weight, user_deck_id: @second_user_deck.id)
      end
    end

    it "can calculate the weighted average of a user deck over time" do
      @first_avg_score = @first_user_deck.weighted_score_over_time
      second_avg_score = @second_user_deck.weighted_score_over_time

      expect(@first_avg_score).to eq(4)
      expect(@first_avg_score).not_to eq(second_avg_score)
      expect(second_avg_score).to eq(6)

    end

    it "can aggregate weighted average of a user deck across all users" do
      avg_score_regardless_of_user = UserDeck.weighted_score_across_users_over_time

      expect(avg_score_regardless_of_user).to eq(5)
      expect(avg_score_regardless_of_user).not_to eq(@first_avg_score)
    end
  end
end
