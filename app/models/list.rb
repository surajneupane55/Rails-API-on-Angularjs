class List < ActiveRecord::Base
  belongs_to :task, class_name: Task
  validates :description, presence: :true, length: {maximum:100}
  validates :task, presence: true
end
