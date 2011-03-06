require 'spec_helper'

describe User do

  # runs the enclosed code before each test
  before(:each) do
    @attr = { :first_name => "Example", :last_name => "User", :email => "user@example.com" }
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



end
