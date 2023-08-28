class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.string :name
      t.string :description

      t.timestamps
    end

    50.times do |i|
      Test.create(name: "Test ##{i}", description: "A product.#{i}")
    end
  end
end
