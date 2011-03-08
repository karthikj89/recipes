# == Schema Information
# Schema version: 20110304085841
#
# Table name: users
#
#  id         :integer         not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base

  # makes these attributes accessible publicly
  attr_accessor :password
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # validation
  validates :first_name,  :presence     => true,
                          :length       => { :maximum => 50 }
  validates :last_name,   :presence     => true,
                          :length       => { :maximum => 50 }
  validates :email,       :presence     => true,
                          :format       => { :with => email_regex},
                          :uniqueness   => { :case_sensitive => false } 
  validates :password,    :presence     => true,
                          :confirmation => true,
                          :length       => { :within => 8..40 }

  # we register a callback called encrypt_password by passing a 
  # symbol of that name to the before_save method, and then define
  # an encrypt_password method to perform the encryption.
  #
  # By using before_save, Active Record automatically calls the
  # corresponding method (in this case, encrypt_password) before
  # saving the record.
  before_save :encrypt_password


  # private methods
  private  
    # this extra indention is a convention. though unnecessary,
    # it helps reinforce the fact that the methods declared after
    # the "private" keyterm are used internally by the object.

    def encrypt_password
      # the argument on the right hand side is implicitly self.password
      self.encrypted_password = encrypt( password )
    end

    def encrypt( string )
      string
    end
end
