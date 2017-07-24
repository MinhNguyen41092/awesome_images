require 'rails_helper'

RSpec.describe "users/index", type: :feature, js: true do
  before do
    DatabaseCleaner.clean
    5.times {FactoryGirl.create :user, role: 0}
    @users = User.normal
    @user = FactoryGirl.create :user
    login_as(@user, scope: :user)
    visit users_path
  end

  describe "UI index page" do
    it "should display title" do
      expect(page).to have_content "All Users"
    end

    it "should display correct number of table rows" do
      expect(page).to have_css "tr", count: User.count + 2
    end

    it "should display delete button" do
      expect(page).to have_xpath "//i[@class= 'fa fa-trash-o fa-lg']"
    end

    it "should display set admin button" do
      expect(page).to have_xpath "//i[@class= 'fa fa-user-secret fa-lg']"
    end

    context "delete button" do
      before do
        click_button(@users.first.username)
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

    context "set admin button" do
      before do
        @user_test = @users.first
        click_button("user-#{@user_test.id}")
        wait_for_ajax
      end

      describe "set admin" do
        it "should set user to admin" do
          @user_test.reload
          expect(@user_test.admin?).to eql true
        end
      end
    end
  end
end
