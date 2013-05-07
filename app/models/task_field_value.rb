class TaskFieldValue < ActiveRecord::Base
  belongs_to :task
  belongs_to :task_field

  attr_accessible :task, :task_field, :value
end
