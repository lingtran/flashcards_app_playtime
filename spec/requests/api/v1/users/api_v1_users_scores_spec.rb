require 'rails_helper'

RSpec.describe "Api::V1::Users::ScoresController", type: :request do
  describe "GET index" do
    before(:each) do
      load_associations_btwn_users_user_decks_study_sessions
      deck_id = deck.id
      get "/api/v1/users/scores?deck_id=#{deck_id}"
    end

    it "returns an index response" do
      expect(response).to have_http_status(200)
      expect(response).to be_success
    end

    it "returns user deck records for users specific to a deck" do
      expect(response_body.count).to eq(2)
      expect(response_body.first[:user_id]).to eq(1)
      expect(response_body.first.keys).to include(:user_id, :average_deck_score, :study_rate_per_week, :mastery_level)
    end
  end
end
