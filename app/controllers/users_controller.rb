class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :show]
  before_action :correct_user, only: [:edit, :update]
  before_action :load_user, except: [:index, :new, :create]

  def index
    @users = User.paginate page: params[:page]
  end

  def show
  end

  def edit
    @user = current_user
    byebug
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "create.message_success"
      redirect_to root_url
    else
      render :new
    end
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "users.profile_updated"
      redirect_to @user
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end
  
  def load_user
    @user = User.find_by_id params[:id]
  end
end
