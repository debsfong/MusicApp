class UsersController < ApplicationController
  def new
    logout(current_user) if current_user
    # @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      login(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    if logged_in?
      render :show
    else
      redirect_to new_session_url
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
