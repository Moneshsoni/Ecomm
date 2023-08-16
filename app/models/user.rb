class User < ApplicationRecord
  has_many :products
  before_create :generate_confirmation_token
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable

  after_create :send_confirmation_mail


  def send_confirmation_mail
    UserMailer.confirmation_email(self).deliver_now
  end


  def generate_confirmation_token
    self.confirmation_token = SecureRandom.urlsafe_base64.to_s
  end
end
