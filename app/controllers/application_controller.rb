class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authorize_user

  def logged_in?
    !!session[:user_id]
  end

  def authorize_user
    unless logged_in?
      # flash[:notice] = 'You must be logged in'
      redirect_to root_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
