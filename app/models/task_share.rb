class TaskShare < ActiveRecord::Base
  belongs_to :user
  belongs_to :task

  attr_accessor :email

  validates :task_id, presence: true, uniqueness: { scope: :user_id, message: "already shared with the user" }
  validates :user_id, presence: true
end
