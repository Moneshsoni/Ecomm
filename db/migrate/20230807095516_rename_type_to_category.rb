class RenameTypeToCategory < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :type, :catogery
  end

end
