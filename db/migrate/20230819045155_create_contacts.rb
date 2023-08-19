class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :surname
      t.string :city
      t.string :email
      t.boolean :approve
      t.string :requirement

      t.timestamps
    end
  end
end
