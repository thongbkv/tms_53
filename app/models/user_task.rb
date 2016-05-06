class UserTask < ActiveRecord::Base
  belongs_to :user
  belongs_to :user_subject
  belongs_to :task
end
