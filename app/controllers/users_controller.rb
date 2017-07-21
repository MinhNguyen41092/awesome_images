class UsersController < ApplicationController
  before_action :load_user, except: :index

  def index
    @users = User.order created_at: :desc
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
