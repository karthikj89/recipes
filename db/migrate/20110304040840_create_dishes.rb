class CreateDishes < ActiveRecord::Migration
  def self.up
    create_table :dishes do |t|
      t.string :name
      t.integer :quantity
      t.references :restaurant
      t.float :price
      t.string :type
      t.float :rating

      t.timestamps
    end
  end

  def self.down
    drop_table :dishes
  end
end
