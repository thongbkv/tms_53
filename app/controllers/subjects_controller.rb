class SubjectsController < ApplicationController
  def index
    @subjects = Subject.paginate page: params[:page]
  end

  def show
    @subjects = Subject.find params[:id]
  end
end
