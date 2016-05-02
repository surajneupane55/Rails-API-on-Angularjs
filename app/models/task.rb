class Task < ActiveRecord::Base
  belongs_to :user, class_name: User
  has_many :lists, foreign_key: :task_id, dependent: :destroy

  validates :user, presence: true
  validates :name, presence:true


end
