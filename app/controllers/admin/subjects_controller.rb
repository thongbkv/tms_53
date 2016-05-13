class Admin::SubjectsController < ApplicationController
  before_action :logged_in_user, :require_admin
  before_action :find_subject, except: [:new, :index]

  def index
    @subjects = Subject.paginate page: params[:page]
  end

  def show
  end

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

  def edit
  end

  def update
    if @subject.update_attributes subject_params
      flash[:success] = t "admin.edit_subject_message"
      redirect_to edit_admin_subject_path
    else
      render :edit
    end
  end

  def destroy
    if @subject.destroy
      flash[:success] = t "destroy_success"
      redirect_to admin_subjects_path
    end
  end

  private
  def subject_params
    params.require(:subject).permit :title, :description,
      tasks_attributes: [:id, :title, :content, :_destroy]
  end

  def find_subject
    @subject = Subject.find params[:id]
  end
end
