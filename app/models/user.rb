class User < ApplicationRecord
  has_many :products
  before_create :generate_confirmation_token
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable

  private

  def generate_confirmation_token
    self.confirmation_token = SecureRandom.hex(16)
  end
end
