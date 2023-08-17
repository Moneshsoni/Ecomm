class RemoveStatusFromAddcarts < ActiveRecord::Migration[7.0]
  def change
    remove_column :addcarts, :status, :string
  end
end