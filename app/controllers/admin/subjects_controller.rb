class Admin::SubjectsController < ApplicationController
  before_action :logged_in_user, :require_admin

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] = t "create_subject_success"
      redirect_to new_admin_subject_path
    else
      flash[:danger] = t "error_subject"
      render :new
    end
  end

  private
  def subject_params
    params.require(:subject).permit :title, :description,
      tasks_attributes: [:title, :content]
  end
end
