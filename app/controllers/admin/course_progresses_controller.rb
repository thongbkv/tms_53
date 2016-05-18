class Admin::CourseProgressesController < ApplicationController
  before_action :logged_in_user, :require_admin
  before_action :load_course, only: :index

  def index
  end

  private
  def load_course
    @course = Course.find params[:course_id]
  end
end
