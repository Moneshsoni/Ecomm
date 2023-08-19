class Contact < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["approve", "boolean", "city", "created_at", "email", "id", "name", "requirement", "surname", "updated_at"]
  end
end
