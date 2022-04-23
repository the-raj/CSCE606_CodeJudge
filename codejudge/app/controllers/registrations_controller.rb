class RegistrationsController < ApplicationController
  layout "welcome"

  # instantiates new user
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    puts @user.attributes
    # puts @user.errors.full_messages
    if @user.save
    # stores saved user id in a session
      redirect_to root_path, notice: 'Successfully created account'
    else
      render :new
    end
  end
  private
  def user_params
    # strong parameters
    params.require(:user).permit(:email, :username, :password, :password_confirmation, :firstname, :lastname)
  end
end