class Admin::CoursesController < ApplicationController
  before_action :logged_in_user, :require_admin
  before_action :load_course, except: [:new, :index, :create]
  before_action :load_subject, only: [:new, :edit]

  def index
    @courses = Course.all
  end

  def show
    @members = @course.user_courses
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new course_params
    if @course.save
      @course.create_activity :update_course, owner: current_user,
        content: t("courses.status", status: @course.status),
        target: @course.name, target_id: @course.id
        byebug

      flash.now[:success] = t "admin.add_course_success"
      redirect_to admin_course_path @course
    else
      load_subjects
      render :new
    end
  end

  def edit
  end

  def update
    if @course.update_attributes course_params
      flash[:succes] = t "admin.edit_course_message"
      redirect_to admin_course_path @course
    else
      load_subjects
      render :edit
    end
  end

  def destroy
    @course.destroy
    flash[:success] = t "admin.success_delete_message"
    redirect_to admin_courses_path
  end

  private
  def course_params
    params.require(:course).permit :name, :description, :status, subject_ids:[]
  end

  def load_course
    @course = Course.find params[:id]
  end

  def load_subject
    @subjects = Subject.all
  end
end
