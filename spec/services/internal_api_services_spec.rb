require 'rails_helper'

RSpec.describe "InternalApiServices" do
  VCR.use_cassette "study_sessions#score" do
    it "it can send score to create a study session" do

      service = InternalApiServices.new
      session_date = "some date"
      session_deck = "some deck"
      session_score = 5
      user = set_user
      user_id = user.id

      response = service.parse_score(session_date, session_deck, session_score, user_id)
      binding.pry

      # what to expect of post request response?
    end
  end
end
