require 'rails_helper'

RSpec.describe ScoreConversion, type: :model do
  context "#record" do
    it " can create a study session" do
      deck = create(:deck)
      score = 7
      user = set_user
      original_study_session_count = StudySession.count
      original_user_deck_count = UserDeck.count

      ScoreConversion.process(deck, user, score)

      new_study_session_count = StudySession.count
      new_user_deck_count = UserDeck.count

      expect(original_study_session_count).not_to eq(new_study_session_count)
      expect(original_user_deck_count).not_to eq(new_user_deck_count)

      ScoreConversion.process(deck, user, score)

      count_when_same_user_deck = UserDeck.count

      expect(new_user_deck_count).to eq(count_when_same_user_deck)
    end

    it "can assign weight to scores" do
      first_score = 2
      second_score = 5
      third_score = 7

      novice_score_weight = ScoreConversion.assign_weight(first_score)
      badass_in_training_score_weight = ScoreConversion.assign_weight(second_score)
      master_score_weight = ScoreConversion.assign_weight(third_score)

      expect(novice_score_weight).to eq(1)
      expect(badass_in_training_score_weight).to eq(2)
      expect(master_score_weight).to eq(3)
    end

    it "can create a study session" do
      deck = create(:deck)
      user = set_user
      score = 7
      user_deck = create(:user_deck, user_id: user.id, deck_id: deck.id)
      create(:study_session, user_deck_id: user_deck.id)

      expect(StudySession.find_by(user_deck_id: user_deck.id).user_deck.id).to eq(1)
      expect(StudySession.first.id).to eq(1)
      expect(StudySession.last.id).to eq(1)

      weight = ScoreConversion.assign_weight(score)

      new_study_session = ScoreConversion.study_session_handler(user_deck, score, weight)

      expect(StudySession.find_by(user_deck_id: user_deck.id).user_deck.id).to eq(1)
      expect(StudySession.first.id).to eq(1)
      expect(StudySession.last.id).to eq(new_study_session.id)
    end

    it "can update a user deck with average score, mastery level and study rate" do
      deck = create(:deck)
      user = set_user
      score = 7
      user_deck = create(:user_deck, user_id: user.id, deck_id: deck.id)

      expect(user_deck.average_deck_score).to eq(0)
      expect(user_deck.mastery_level).to eq(1)
      expect(user_deck.study_rate_per_week).to eq(nil)

      weight = ScoreConversion.assign_weight(score)
      ScoreConversion.study_session_handler(user_deck, score, weight)

      user_deck = ScoreConversion.user_deck_update_handler(user_deck)

      expect(user_deck.average_deck_score).to eq(7)
      expect(user_deck.mastery_level).to eq(3)
      expect(user_deck.study_rate_per_week).to eq(0)
    end
  end

end
