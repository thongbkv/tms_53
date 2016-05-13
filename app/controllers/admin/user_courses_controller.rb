class Admin::UserCoursesController < ApplicationController
  def destroy
    @user_course = UserCourse.find_by_id params[:id]
    if @user_course.destroy
      flash[:success] = t "admin.user_course_success"
      redirect_to :back
    else
      flash.now[:danger] = t "admin.user_course_error"
      redirect_to :back
    end
  end
end
