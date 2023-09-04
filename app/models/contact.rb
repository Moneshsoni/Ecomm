class Contact < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["approve", "boolean", "city", "created_at", "email", "id", "name", "requirement", "surname", "updated_at"]
  end
  validates :name, presence: true
  validates :surname, presence: true
  validates :city, presence: true
  validates :requirement, presence: true 
end
