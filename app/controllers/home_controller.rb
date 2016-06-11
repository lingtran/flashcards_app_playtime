class HomeController < ApplicationController
  def index
    redirect_to flashcards_user_path(current_user) if current_user
  end
end
