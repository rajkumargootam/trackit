class SharedTask < ActiveRecord::Base
  belongs_to :user
  belongs_to :task

  attr_accessor :email

  validates :user_id, presence: true
  validates :task_id, presence: true, uniqueness: {scope: :user_id, message: "already shared with user"}
end
