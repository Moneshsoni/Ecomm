class Product < ApplicationRecord
	belongs_to :user
	has_many :addcarts
	has_one_attached :image
	
	def self.ransackable_attributes(auth_object = nil)
    	["catogery", "company", "created_at", "description", "id", "name", "price", "updated_at", "user_id"]
  	end


  	def add_product(product)
	    cart_item = addcarts.find_or_initialize_by(product_id: product.id)
	    cart_item.quantity += 1
	    cart_item.save
  	end
end
