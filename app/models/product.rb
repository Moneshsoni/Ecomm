class Product < ApplicationRecord
	belongs_to :user
	has_one_attached :image
	has_many :likes
	validates :price, presence: true, numericality: { greater_than: 0 }
	

	def price_in_cents
    	(price * 100).to_i
 	end

	def liked?(user)
	  !!self.likes.find{|like| like.user_id == user.id}
	end

	def self.ransackable_attributes(auth_object = nil)
    	["catogery", "company", "created_at", "description", "id", "name", "price", "updated_at", "user_id"]
  	end


  	def add_product(product)
	    cart_item = addcarts.find_or_initialize_by(product_id: product.id)
	    cart_item.quantity += 1
	    cart_item.save
  	end
end
