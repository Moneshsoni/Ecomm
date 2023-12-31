class User < ApplicationRecord
  has_many :products
  has_many :addcarts
  has_many :credit_cards, dependent: :destroy
  
  before_create :generate_confirmation_token
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable, :confirmable, :trackable

  after_create :send_confirmation_mail

  after_commit :assign_customer_id, on: :create

  def assign_customer_id
    customer = Stripe::Customer.create(email: email)
    self.customer_id = customer.id
  end

  def send_confirmation_mail
    UserMailer.confirmation_email(self).deliver_now
  end


  def generate_confirmation_token
    self.confirmation_token = SecureRandom.urlsafe_base64.to_s
  end

  def self.ransackable_attributes(auth_object = nil)
    ["approve", "confirmation_sent_at", "confirmation_token", "confirmed_at", "created_at", "current_sign_in_at", "current_sign_in_ip", "email", "encrypted_password", "id", "last_sign_in_at", "last_sign_in_ip", "remember_created_at", "reset_password_sent_at", "reset_password_token", "sign_in_count", "unconfirmed_email", "updated_at", "user_type"]
  end
end
