# == Schema Information
# Schema version: 20110304085841
#
# Table name: dishes
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  quantity      :integer
#  restaurant_id :integer
#  price         :float
#  type          :string(255)
#  rating        :float
#  created_at    :datetime
#  updated_at    :datetime
#

class Dish < ActiveRecord::Base
  attr_accessible :name, :quantity, :restaurant, :price, :type, :rating
  belongs_to :restaurant

  def total_price
    self.price * self.quantity
  end
end
