class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :category
      t.string :city
      t.string :country
      t.string :owner

      t.timestamps
    end
  end
end
