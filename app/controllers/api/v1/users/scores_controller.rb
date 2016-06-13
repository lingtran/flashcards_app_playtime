class Api::V1::Users::ScoresController < Api::ApiController
  def index
    # write request test
    respond_with UserDeck.weighted_score_over_time_for_deck(params[:deck_id])
  end
end
