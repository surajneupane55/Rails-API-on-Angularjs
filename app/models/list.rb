class List < ActiveRecord::Base
  belongs_to :task, class_name: Task
  validate :description, presence: :true, length: {maximum:100}
  validate :list, presence: true
end
