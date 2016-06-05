class FacebookService
  def initialize
    # look into Facebook docs
    @_connection = Faraday.new
    @_connection.headers["Authorization"] = "Bearer #{token}"
  end

  private

  def connection
    @_connetion
  end
end
