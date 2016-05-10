class Subject < ActiveRecord::Base
  has_many :user_subjects, dependent: :destroy
  has_many :course_subjects, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :users, through: :user_subjects
  has_many :courses, through: :course_subjects

  validates :title, presence: true, length: {maximum: 50}

  accepts_nested_attributes_for :tasks,
    reject_if: proc {|attributes| attributes[:content].blank?},
    allow_destroy: true
end
