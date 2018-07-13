class UsersController < ApplicationController

  helper_method :current_user, :logged_in?, :log_in_user!

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user!(@user)
      @current_user = @user
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end


  def user_params
    params.require(:user).permit(:email, :password)
  end


end
