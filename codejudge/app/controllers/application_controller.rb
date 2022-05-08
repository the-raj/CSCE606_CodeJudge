class ApplicationController < ActionController::Base
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :require_user_logged_in!

  helper_method :current_user

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def set_current_user
    # print session[:user_id]
    # Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_user_logged_in!
    if @current_user.nil?
      redirect_to root_path, alert: 'You must be signed in'
    else
      redirect_to '/errors/forbidden'
    end
  end

  def color_mode
    cookies[:color_mode] = { value: params[:color_mode] }
    redirect_to problems_path, notice: "Color Mode set to #{params[:color_mode].capitalize}"
  end
end
