class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
after_create :generate_authentication_token!




  private
  def generate_authentication_token!
    self.authenticate_token = Digest::SHA2.hexadigest("#{Time.now}-#{self.id}-#{self.updated_at}")
    self.save
  end
end
