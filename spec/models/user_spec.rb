require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create(first_name: "sepid", last_name: "mir", email: "sepid@test.com", password: "asdfasdf")
  end
  describe "creation" do
    
    it "can be created" do
      expect(@user).to be_valid
    end

    it "cannot be created without first name, last name" do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

  end

  describe "custom name methods" do 

    it "has a full name that combines first name and last name" do
      expect(@user.full_name).to eq("MIR, SEPID")
    end
  end
  
end
