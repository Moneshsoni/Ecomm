class Product < ApplicationRecord
	belongs_to :user
	has_one_attached :image

	def self.ransackable_attributes(auth_object = nil)
    ["catogery", "company", "created_at", "description", "id", "name", "price", "updated_at", "user_id"]
  end

end
