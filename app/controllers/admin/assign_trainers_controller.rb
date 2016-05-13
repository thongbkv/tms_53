class Admin::AssignTrainersController < ApplicationController
  before_action :load_course, only: [:update, :edit]
  before_action :load_users, only: :edit

  def edit
    @course_users = @course.users
  end

  def update
    if @course.update_attributes course_user_params
      flash[:success] = t "admin.create_success_course_user"
      redirect_to admin_course_path @course
    else
      load_user
      redirect_to new_admin_assign_trainers_path
    end
  end

  private
  def course_user_params
    params.require(:course).permit user_courses_attributes: [:id, :user_id, :_destroy]
  end

  def load_course
    @course = Course.find params[:course_id]
  end

  def load_users
    @users = User.supervisor
  end
end
