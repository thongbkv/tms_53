class Admin::AssignTraineesController < ApplicationController
  before_action :logged_in_user, :require_admin
  before_action :load_course, only: [:update, :edit]
  before_action :load_users, only: :edit

  def edit
    @users.each do |user|
      @course.user_courses.find_or_initialize_by user: user
    end
  end

  def update
    if @course.update_attributes course_user_params
      flash[:success] = t "admin.create_success_course_user"
      redirect_to admin_course_path @course
    else
      redirect_to edit_admin_assign_trainees_path
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
    @users = User.trainee
  end
end
