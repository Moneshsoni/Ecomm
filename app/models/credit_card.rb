class CreditCard < ApplicationRecord
  belongs_to :user
  validates :number, presence: true, length: { is: 16 }
  validates :expiration_month, presence: true, inclusion: { in: 1..12 }
  validates :expiration_year, presence: true, numericality: { greater_than_or_equal_to: Date.current.year }
  validates :cvv, presence: true, length: { is: 3 }

end
