class ApplicationController < ActionController::Base
  before_action :set_current_user, :require_user_logged_in!
  def set_current_user
    print session[:user_id]
    Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
  end
  def require_user_logged_in!
    redirect_to root_path, alert: 'You must be signed in' if Current.user.nil?
  end
end
