class Admin::CoursesController < ApplicationController
  before_action :logged_in_user, :require_admin

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find params[:id]
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new course_params
    if @course.save
      flash.now[:success] = t "admin.add_course_success"
      redirect_to admin_course_path @course
    else
      render :new
    end
  end

  private
  def course_params
    params.require(:course).permit :name, :description, :status
  end
end
