class AddDefaultToApproveInUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :approve, :boolean, default: false
  end
end
