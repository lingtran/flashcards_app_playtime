class Api::V1::StudySessions::ScoresController < Api::ApiController
  # have a before_create action? or an after_commit method?
  def index
    respond_with StudySessions.all
  end

  def create
    # params: deck_question_word, user, score, timestamp
    # create user_deck
    # create studysession with user, deck, score
    if 0 <= params[:score] <= 3
      assign_weight = 1
    elsif params[:score] == 7
      assign_weight = 3
    else
      assign_weight = 2
    end

    user_deck = UserDeck.find_or_create_by(user_id: params[:user], deck: params[:deck])
    StudySession.create( date: Time.now, user_deck_id: user_deck.id, score: params[:score], weight: assign_weight )

    redirect_to api_v1_study_sessions_scores_path
  end
end
