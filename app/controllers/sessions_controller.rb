class SessionsController < ApplicationController
  def create
    if user = User.from_omniauth(auth_hash)
      session[:user_id] = user.id
    end
    redirect_to flashcards_user_path(current_user)
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
