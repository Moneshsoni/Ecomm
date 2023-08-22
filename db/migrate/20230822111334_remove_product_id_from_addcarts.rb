class RemoveProductIdFromAddcarts < ActiveRecord::Migration[7.0]
  def change
   remove_column :addcarts, :product_id, :integer 
  end
end
