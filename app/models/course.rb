class Course < ActiveRecord::Base
  has_many :user_courses, dependent: :destroy
  has_many :course_subjects, dependent: :destroy
  has_many :users, through: :user_courses
  has_many :subjects, through: :course_subjects

  enum status: [:init, :inprogress, :finished]

  validates :name, presence: true, length: {maximum: 255}

  accepts_nested_attributes_for :user_courses, allow_destroy: true

  after_update :assign_trainee_to_subject, if: :status_changed_into_inprogress?

  private
  def assign_trainee_to_subject
    users.trainee.each do |trainee|
      course_subjects.each do |course_subject|
        UserSubject.find_or_create_by user: trainee, subject: course_subject.subject,
          course_subject: course_subject
      end
    end
  end

  def status_changed_into_inprogress?
    status_changed? && inprogress?
  end
end
