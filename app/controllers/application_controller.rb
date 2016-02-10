class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  before_action :ensure_current_user, only: [:new, :create, :update, :destroy]

  def current_user
    user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def ensure_current_user
    redirect_to new_session_path unless current_user
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def logged_in?
    !current_user.nil?
  end
end
