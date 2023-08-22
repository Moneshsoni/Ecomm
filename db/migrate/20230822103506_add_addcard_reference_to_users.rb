class AddAddcardReferenceToUsers < ActiveRecord::Migration[7.0]
  def change  
    add_reference :addcarts, :user, foreign_key: true
  end
end
