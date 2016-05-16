class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
  	@activities = PublicActivity::Activity.all
    @course = Course.find params[:id]
  end
end
