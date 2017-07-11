require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = FactoryGirl.create :user
  end
  describe "validations" do
    it {should validate_presence_of :username}
    it {should validate_uniqueness_of(:username).case_insensitive}

    it "should not have username of other people email" do
      user1 = FactoryGirl.build :user, username: @user.email
      expect(user1.save).to be false
    end
  end
end
