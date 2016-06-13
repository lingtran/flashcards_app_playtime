class Api::V1::Users::ScoresController < Api::ApiController
  def index
    respond_with UserDeck.where(deck_id: params[:deck_id].to_i)
  end

end
