class WelcomeController < ApplicationController
  def index
    unless current_user.nil?
      redirect_to problems_path
    end
  end

  def log_in
    user = User.find_by(username: params[:username])
    # finds existing user, checks to see if user can be authenticated
    if user.present? && user.authenticate(params[:password])
    # sets up user.id sessions
      session[:user_id] = user.id
      redirect_to problems_path, notice: 'Logged in successfully'
    else
      redirect_to root_path, notice: "Incorrect username or password"
    end
  end

  def log_out
    # deletes user session
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged Out'
  end
end
