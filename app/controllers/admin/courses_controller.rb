class Admin::CoursesController < ApplicationController
  before_action :logged_in_user, :require_admin
  before_action :load_course, except: [:new, :index, :create]
  before_action :load_subject, only: [:new, :edit]

  def index
    @courses = Course.all
  end

  def show
    @course_subjects = @course.course_subjects
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
      load_subjects
      render :new
    end
  end

  def edit
  end

  def update
    if @course.update_attributes course_params
      flash[:success] = t "admin.edit_course_message_success"
      respond_to do |format|
        format.html {redirect_to :back}
        format.js
      end
    else
      flash[:danger] = t "admin.update_error"
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
    params.require(:course).permit :name, :description, :status, subject_ids:[],
      user_ids: []
  end

  def load_course
    @course = Course.find params[:id]
  end

  def load_subject
    @subjects = Subject.all
  end
end
