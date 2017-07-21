require 'rails_helper'

RSpec.describe "users/index", type: :feature, js: true do
  before do
    DatabaseCleaner.clean
    5.times {FactoryGirl.create :user}
    @user = FactoryGirl.create :user
    visit users_path
  end

  describe "UI index page" do
    it "should display title" do
      expect(page).to have_content "All Users"
    end

    it "should display correct number of table rows" do
      expect(page).to have_css "tr", count: User.count + 1
    end

    it "should display delete button" do
      expect(page).to have_css "button"
      expect(page).to have_xpath "//i[@class= 'fa fa-trash-o fa-lg']"
    end

    before do
      click_button(@user.username)
      wait_for_ajax
    end

    describe "delete user" do
      it "can delete user" do
        expect(User.count).to eql 5
      end

      it "should display flash message" do
        expect(page).to have_content "User has been deleted"
      end
    end
  end
end
