class AddColumnsToAddcart < ActiveRecord::Migration[7.0]
  def change
    add_column :addcarts, :initial_product_price, :integer
  end
end
