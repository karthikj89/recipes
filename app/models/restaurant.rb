# == Schema Information
# Schema version: 20110304085841
#
# Table name: restaurants
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  user_id     :integer
#  address     :string(255)
#  phone       :string(255)
#  email       :string(255)
#  cuisine     :string(255)
#  rating      :float
#  open_time   :time
#  close_time  :time
#  price_range :float
#  created_at  :datetime
#  updated_at  :datetime
#

class Restaurant < ActiveRecord::Base
  attr_accessible :name, :user, :address, :phone, :email, :cuisine, :rating, :open_time, :close_time, :price_range
  belongs_to :user
end
