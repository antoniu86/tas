require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user1 = User.new({
      :first_name => "first name 1",
      :last_name => "last name 1",
      :birthdate => "1986-02-10 00:00:00",
      :email => "12345@hotmail.com",
      :password => "231crfewc",
      :sign_in_count => 0,
      :failed_attempts => 0,
      :created_at => Time.now,
      :updated_at => Time.now
    })

    @user2 = User.new({
      :first_name => "first name 2",
      :last_name => "last name 2",
      :birthdate => "1986-02-10 00:00:00",
      :email => "12345@hotmail.com",
      :password => "231crfewc",
      :sign_in_count => 0,
      :failed_attempts => 0,
      :created_at => Time.now,
      :updated_at => Time.now
    })
  end

  test "user create" do
    assert @user1.save, "User not created"
  end

  test "user create fail" do
    assert @user1.save, "User 1 not created"
    assert @user2.save, "User 2 not created"
  end

  test "user updated pass" do
    assert @user1.save, "User not saved"
    @user1.first_name = "first"
    @user1.last_name = "last"
    assert @user1.save, "User not updated"
  end

  test "user updated fail" do
    assert @user1.save, "User not saved"
    @user1.email = nil
    assert @user1.save, "User not updated"
  end

  test "user destroy" do
    assert @user1.save, "User not saved"
    assert @user1.destroy, "User not destroyed"
  end
end
