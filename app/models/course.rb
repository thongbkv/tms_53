class Course < ActiveRecord::Base
  has_many :user_courses, dependent: :destroy
  has_many :course_subjects, dependent: :destroy
  has_many :users, through: :user_courses
  has_many :subjects, through: :course_subjects

  enum status: [:init, :inprogress, :finished]

  validates :name, presence: true, length: {maximum: 255}

  accepts_nested_attributes_for :user_courses, allow_destroy: true
end
