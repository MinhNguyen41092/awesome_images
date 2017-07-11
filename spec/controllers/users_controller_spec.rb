require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "get #index" do
    before :each do
      5.times do
        FactoryGirl.create :user
      end
      get :index
    end

    it {should respond_with 200}

    it "should access index page" do
      expect(response).to render_template :index
    end
  end
end
