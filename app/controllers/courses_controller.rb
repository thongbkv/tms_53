class CoursesController < ApplicationController

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find params[:id]
    @activities = PublicActivity::Activity.all
  end
end
