class ApplicationController < ActionController::Base

  #current_user to return the current user.
#logged_in? to return a boolean indicating whether someone is signed in.
#log_in_user!(user)

  def current_user
    @current_user
  end

  def logged_in?
    @current_user.session_token == session[:session_token]
  end

  def log_in_user!(user)
    @current_user = user
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

end
