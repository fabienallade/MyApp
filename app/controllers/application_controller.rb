class ApplicationController < ActionController::Base
protect_from_forgery with: :exception
helper_method :current_user,:logged_in?
  def current_user
    @current_user ||=User.find_by(id: session[:user_id])
=begin
    if session[:user_id]

    end
=end
  end
  def authenticate_user!
    redirect_to '/login'
    unless current_user

    end
  end
  private
  def logged_in?
    !!current_user
  end
  def require_user
  if !logged_in?
    flash[:danger] = "Vous devez etre connectez avant de pourvoir travailler ici"
    redirect_to root_path
  end
  end

end
