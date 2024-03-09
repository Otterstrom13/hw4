
class ApplicationController < ActionController::Base
  before_action :require_login
  helper_method :current_user, :logged_in?

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this page."
      redirect_to login_path
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session["user_id"])
  end

  def logged_in?
    current_user.present?
  end
end
