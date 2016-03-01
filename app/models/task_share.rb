class TaskShare < ActiveRecord::Base
  belongs_to :user
  belongs_to :task

  attr_accessor :email
end
