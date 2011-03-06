require 'spec_helper'

describe User do

  # runs the enclosed code before each test
  before(:each) do
    @attr = { 
      :first_name => "Example",
      :last_name => "User",
      :email => "user@example.com",
      :password => "foobarbaz",
      :password_confirmation => "foobarbaz"
    }
  end

  it "should create a new instance given valid attributes" do
    # create! raises an exception if something goes wrong
    User.create!(@attr)
  end

  it "should require a last_name" do
    no_last_name_user = User.new(@attr.merge(:first_name => ""))
    no_last_name_user.should_not be_valid
  end

  it "should require a last_name" do
    no_last_name_user = User.new(@attr.merge(:last_name => ""))
    no_last_name_user.should_not be_valid
  end

  it "should require an email" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end

  it "should reject last_names that are too long" do
    long_last_name_user = User.new(@attr.merge(:first_name => "a" * 51))
    long_last_name_user.should_not be_valid
  end

  it "should reject last_names that are too long" do
    long_last_name_user = User.new(@attr.merge(:last_name => "a" * 51))
    long_last_name_user.should_not be_valid
  end
  
  # TODO more robust test cases
  it "should accept valid email addresses" do
    # creates a string array from its elements...
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@food.jp]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end

  it "should reject duplicate emails" do
    User.create!(@attr)
    duplicate_user = User.new(@attr)
    duplicate_user.should_not be_valid
  end

  it "should reject duplicate emails regardless of case" do
    User.create!(@attr)
    # upcased_email = @attr[:email].upcase
    duplicate_user = User.new(@attr.merge(:email => @attr[:email].upcase))
    duplicate_user.should_not be_valid
  end

  describe "password validations" do

    it "should require a password" do
      user = User.new(@attr.merge(:password => "", :password_confirmation => ""))
      user.should_not be_valid
    end

    it "should require a matching password confirmation" do
      non_matching_user = User.new(@attr.merge(:password_confirmation => "invalid"))
      non_matching_user.should_not be_valid
    end

    it "should reject short passwords" do
      short = "a" * 7
      short_password_user = User.new(@attr.merge(:password => short, :password_confirmation => short))
      short_password_user.should_not be_valid
    end

    it "should reject long passwords" do
      long = "a" * 41
      long_password_user = User.new(@attr.merge(:password => long, :password_confirmation => long))
      long_password_user.should_not be_valid
    end
  end

  describe "password encryption" do

    before(:each) do
      @user = User.create!(@attr)
    end

    it "should have an encrypted password attribute" do
      @user.should.respond_to?(:encrypted_password)
    end
  end
end
