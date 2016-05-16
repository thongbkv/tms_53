class Course < ActiveRecord::Base
  attr_accessor :pre_trainee, :pre_supervisor, :pre_status

  has_many :user_courses, dependent: :destroy
  has_many :course_subjects, dependent: :destroy
  has_many :users, through: :user_courses
  has_many :subjects, through: :course_subjects

  enum status: [:init, :inprogress, :finished]

  validates :name, presence: true, length: {maximum: 255}

  accepts_nested_attributes_for :user_courses, allow_destroy: true

  after_update :assign_trainee_to_subject, if: :status_changed_into_inprogress?

  before_save :store_previous_assignee_and_supervisors
  after_save :create_course_activity
  after_update :create_activity

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
  
  private
  def create_activity
    activity_supervisor_join self.users.supervisor, self.pre_supervisor, Settings.joined_trainer
    activity_supervisor_remove self.pre_supervisor, self.users.supervisor, Settings.removed_trainer
    activity_trainee_join self.users.trainee, self.pre_trainee, Settings.joined
    activity_trainee_remove self.pre_trainee, self.users.trainee, Settings.removed
  end

  ["supervisor_join", "supervisor_remove", "trainee_join", "trainee_remove"].each do |action|
    define_method("activity_#{action}") do |new_user, old_user, notice|
      (new_user - old_user).each do |user|
        Activity.create user_id: user.id, content: notice, target: self.name, target_id: self.id
      end
    end
  end

  def store_previous_assignee_and_supervisors
    self.pre_supervisor = Array.new(self.users.supervisor)
    self.pre_trainee = Array.new(self.users.trainee)
  end

  def create_course_activity
    Activity.create user_id: self.user_id,
      content: "init course", target: self.name, target_id: self.id
  end
end
