class Course < ActiveRecord::Base
  has_many :user_courses, dependent: :destroy
  has_many :course_subjects, dependent: :destroy
  has_many :users, through: :user_courses
  has_many :subjects, through: :course_subjects

  enum status: [:init, :inprogess, :finished]

  validates :name, presence: true, length: {maximum: 255}
end
