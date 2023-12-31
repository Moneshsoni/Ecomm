class CreateAddcarts < ActiveRecord::Migration[7.0]
  def change
    create_table :addcarts do |t|
      t.integer :quantity, :integer, default: 1
      t.integer :total_price
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
