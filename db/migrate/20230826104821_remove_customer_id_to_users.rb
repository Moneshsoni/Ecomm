class RemoveCustomerIdToUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :customer_id, :string
  end
end
