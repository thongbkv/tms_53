class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  def require_admin
    redirect_to root_path unless current_user.admin?
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t "layouts.login_message"
      redirect_to login_url
    end
  end
end
