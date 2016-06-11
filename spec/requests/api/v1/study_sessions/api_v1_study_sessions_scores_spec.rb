require 'rails_helper'

RSpec.describe "Api::V1::StudySessions::Scores", type: :request do
  describe "POST /api_v1_study_sessions_scores" do
    before(:each) do
      @deck = create(:deck)
      @score = 7
      user = user_logs_in
      date = "some Ruby datetime object"
    end

    it "returns a response" do
      post "/api/v1/study_sessions/scores?date=#{study_date}&deck=#{deck_id}&score=#{score}&user=#{user_id}"
      expect(response).to have_http_status(200)
      expect(response).to be_success
    end

    it "creates a study session record specific to user" do

    end
  end
end
