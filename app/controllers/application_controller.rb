class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?, except: [:update]
  before_action :configure_permitted_update_parameters, if: :devise_controller?, only: [:update]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :mobile_number, :date_of_birth, :gender])
  end

  def configure_permitted_update_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :mobile_number, :date_of_birth, :gender, :avatar])
  end

  def after_sign_up_path_for(resource)
    user_path(resource)
  end

  def after_sign_in_path_for(resource)
    user_path(resource)
  end
end
