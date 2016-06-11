class InternalApiService
  before_action :set_root_url

  def initialize
    @_connection = Faraday.new(url: "#{set_root_url}")
  end

  def post_scores_request(session_date, session_deck, session_score, user_id)
    connection.post '/scores', { date: session_date, deck: session_deck, score: session_score, user: user_id }
  end

  private
    def connection
      @_connection
    end

    def set_root_url
      if ENV['RAILS_ENV'] = 'development'
        root_url = "https://localhost:3000/"
      else
        root_url = "http://lingoapp.herokuapp.com/"
      end
    end
end
