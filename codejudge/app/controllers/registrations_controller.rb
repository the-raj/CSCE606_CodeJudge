class RegistrationsController < ApplicationController
  layout "welcome"

  # instantiates new user
  def new
    @user = User.new
  end

  def create
    unless flash[:google_sign_in].nil?
      @user = sign_up_with_google
    else
      @user = User.new(user_params)
    end

    if @user.save
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

  def sign_up_with_google
    if id_token = flash[:google_sign_in]["id_token"]
      params = GoogleSignIn::Identity.new(id_token)
      User.new(firstname: params.given_name, lastname: params.family_name, username: params.email_address, email: params.email_address, google_id: params.user_id )
    elsif error = flash[:google_sign_in][:error]
      logger.error "Google authentication error: #{error}"
      nil
    end
  end
end