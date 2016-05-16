class Admin::UsersController < ApplicationController
  before_action :logged_in_user, :require_admin
  before_action :find_user, only: [:destroy]

  def index
    @users = User.paginate page: params[:page]
  end

  def show
  end

  def destroy
    if @user.destroy
      flash[:success] = t "controller.destroy_success"
      redirect_to admin_users_path
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end

  def find_user
    @user = User.find params[:id] 
  end
end
