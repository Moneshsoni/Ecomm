class AddColumnsToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :type, :string
    add_column :products, :company, :string
    add_column :products, :description, :string
    add_column :products, :price, :integer
  end
end
