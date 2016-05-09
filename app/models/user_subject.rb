class UserSubject < ActiveRecord::Base
  belongs_to :user
  belongs_to :course_subject
  belongs_to :subject

  has_many :user_tasks, dependent: :destroy
end
