require 'spec_helper'
require 'dish'

describe Dish do
  # example test...
  describe Dish, "#total_price" do
    it "computes correct total price" do
      dish = Dish.new
      dish.quantity = 10
      dish.price = 4.5
      dish.total_price.should == 45.0
    end
  end
end
