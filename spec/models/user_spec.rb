require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
    before do
      @user = User.create(first_name: "sepid", last_name: "mir", email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf")
      # @user2 = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf")
    end

    it "can be created" do
      expect(@user).to be_valid
    end

    it "cannot be created without first name, last name" do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

  end
  
end
