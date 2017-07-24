class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    # main_app helper that gives you access to application's routes inside Engine
    redirect_to main_app.root_path
    flash[:danger] = exception.message
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email,
      :full_name, :role, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email,
      :full_name, :role, :password, :password_confirmation, :current_password) }
  end
end
