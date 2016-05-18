class CourseSubject < ActiveRecord::Base
  belongs_to :course
  belongs_to :subject

  has_many :user_subjects, dependent: :destroy

  enum status: [:init, :inprogress, :finished]
end
