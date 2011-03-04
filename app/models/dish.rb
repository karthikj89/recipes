class Dish < ActiveRecord::Base
  belongs_to :restaurant

  def total_price
    self.price * self.quantity
  end
end
