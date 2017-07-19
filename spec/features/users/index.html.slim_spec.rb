require 'rails_helper'

RSpec.describe "users/index", type: :feature, js: true do
  before do
    DatabaseCleaner.clean
    5.times {FactoryGirl.create :user}
    visit users_path
  end

  describe "UI index page" do
    it "should display title" do
      expect(page).to have_content "All Users"
    end

    it "should display correct number of table rows" do
      expect(page).to have_css "tr", count: 6
    end

    it "should display delete button" do
      expect(page).to have_css "button"
      expect(page).to have_xpath "//i[@class= 'fa fa-trash-o fa-lg']"
    end

    it "can delete user" do
      expect {click_button("#{User.first.username}")}.to change(User, :count).by(-1)
    end
  end
end
