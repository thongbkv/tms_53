class Admin::CourseSubjectsController < ApplicationController
  before_action :logged_in_user, :require_admin
  before_action :find_course_subject

  def update
    if @course_subject.update_attributes course_subject_params
      flash[:success] = t "admin.successfully"
      redirect_to [:admin, @course_subject.course]
    else
      flash[:warning] = t "admin.error"
      redirect_to [:admin, @course_subject]
    end 
  end

  private
  def course_subject_params
    params.require(:course_subject).permit :status, :subject_id, :course_id
  end

  def find_course_subject
    @course_subject = CourseSubject.find params[:id]
  end
end
