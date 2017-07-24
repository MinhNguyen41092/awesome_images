require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "get #index" do
    context "success" do
      before do
        @user = FactoryGirl.create :user
        sign_in @user
        get :index
      end

      it {should respond_with 200}

      it "should access index page" do
        expect(response).to render_template :index
      end

      it "should have current user" do
        expect(subject.current_user).to_not eql nil
      end
    end

    context "failed" do
      before do
        @user = FactoryGirl.create :user, role: 0
        sign_in @user
        get :index
      end

      it {should respond_with 302}

      it "should be redirected to root path" do
        expect(response).to redirect_to root_path
      end

      it "should display flash message" do
        expect(flash[:danger]).to match "You are not authorized"
      end
    end
  end
end
