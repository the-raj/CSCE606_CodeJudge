class WelcomeController < ApplicationController
  layout "login"
  
  def index
  end

  def log_in
    user = User.find_by(email: params[:email])
    # finds existing user, checks to see if user can be authenticated
    if user.present? && user.authenticate(params[:password])
    # sets up user.id sessions
      session[:user_id] = user.id
      # redirect_to root_path, notice: 'Logged in successfully'
      flash.now[:alert] = 'Login successful'
    else
      flash.now[:alert] = 'Invalid email or password'
      render :index
    end
  end
end
