require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user= User.new(username: "jane", email: "janedoe@imc.com", password: "password")
end

test "user should be valid" do
   assert @user.valid?
end

test "username should be present" do
    @user.username = " "
    assert_not @user.valid?
end

test "username should be unique" do
    @user.save
    @user2= User.new(username: "joe ", email: "janedoe@imc.com", password: "password")
    assert @user.valid?

end

test "username should not be too long max 25" do
    @user.username = "a" * 26
    assert_not @user.valid?
end

test "name should not be too short min 3" do
    @user.username = "aa"
    assert_not @user.valid?
end


test "email should be present" do
  @user.email = " "
  assert_not @user.valid?
end

test "email should be unique" do
  @user.save
  @user2= User.new(username: "joe ", email: "jane@imc.com", password: "password")
  assert @user.valid?

end

test "email should not be too long max 110" do
  @user.username = "a" * 111
  assert_not @user.valid?
end


end
