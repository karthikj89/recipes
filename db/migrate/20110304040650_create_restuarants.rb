class CreateRestuarants < ActiveRecord::Migration
  def self.up
    create_table :restuarants do |t|
      t.string :name
      t.string :cuisine
      t.float :price
      t.references :user
      t.string :phone
      t.time :open_time
      t.time :close_time
      t.string :address
      t.string :email
      t.float :rating

      t.timestamps
    end
  end

  def self.down
    drop_table :restuarants
  end
end
