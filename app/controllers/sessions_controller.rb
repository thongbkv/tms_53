class SessionsController < ApplicationController
  def new
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
