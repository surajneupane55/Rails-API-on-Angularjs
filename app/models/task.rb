class Task < ActiveRecord::Base
  belongs_to :user, class_name: User
  has_many :lists, foreign_key: :task_id

  validate :user, presence: true
  validate :name, presence:true

end
