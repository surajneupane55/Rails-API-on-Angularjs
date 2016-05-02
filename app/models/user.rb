class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tasks, foreign_key: :user_id

  after_create :create_task

  before_create do |doc|
    doc.authenticate_token = doc.generate_api_key
  end




  def generate_api_key
    loop do
      token = SecureRandom.base64.tr('+/=', 'Qrt')
      break token unless User.exists?(authenticate_token: token)
    end
  end

  def create_task
    tasks.create!(name:'My First Task')
  end
end
