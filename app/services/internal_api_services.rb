class InternalApiServices
  def initialize
    @_connection = Faraday.new(url: "http://lingoapp.herokuapp.com/")
  end

  def params
    connection.params[:scores]
  end

  def post_score(session_date, session_deck, session_score, user_id)
    connection.post 'api/v1/study_session/scores', { date: session_date, deck: session_deck, score: session_score, user: user_id }
  end

  def parse_score(session_date, session_deck, session_score, user_id)
    parse(post_score(session_date, session_deck, session_score, user_id))
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    def connection
      @_connection
    end
end
