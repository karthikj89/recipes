class CreateRestaurants < ActiveRecord::Migration
  def self.up
    create_table :restaurants do |t|
      t.string :name
      t.references :user
      t.string :address
      t.string :phone
      t.string :email
      t.string :cuisine
      t.float :rating
      t.time :open_time
      t.time :close_time
      t.float :price

      t.timestamps
    end
  end

  def self.down
    drop_table :restaurants
  end
end
