class UsersController < ApplicationController
  before_action :load_user, except: :index
  load_and_authorize_resource

  def index
    @users = User.normal.newest
    @admins = User.admin.oldest
  end

  def update
    @user.update! role: params[:role]
    head :no_content
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = "There is no such user"
    redirect_to :back
  end
end
