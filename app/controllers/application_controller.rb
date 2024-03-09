class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this page."
      redirect_to login_path unless request.path == login_path
    end
  end

  def current_user
    user_id = session["user_id"]
    @current_user ||= User.find_by(id: user_id) if user_id.present?
    puts "Current user_id: #{user_id}, Current User: #{@current_user.inspect}"
    @current_user
  end

  def logged_in?
    current_user.present?
  end
end


