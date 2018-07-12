class SessionsController < ApplicationController

  helper_method :current_user, :logged_in?, :log_in_user!

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      log_in_user!(@user)
      @current_user = @user
    else
      flash[:errors] = ["Invalid username and/or password"]
      redirect_to new_session_url
    end
  end

  def destroy
    logout(current_user)
    redirect_to new_session_url
  end

end
