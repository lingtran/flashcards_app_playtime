class HomeController < ApplicationController
  def index
    redirect_to flashcards_path if current_user
  end
end
