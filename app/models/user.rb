class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable, :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  after_create :send_reset

  def send_reset
    if ENV["disable_email"] == "true"
      self.send_reset_password_instructions
    end
  end

  has_one :staff

  def role
    self.studio_owner rescue false || self.staff.role rescue nil
  end
end
