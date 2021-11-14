class ApplicationController < ActionController::Base
  before_action :configure_sign_up_params, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
      when Admin
        admin_root_path
      when EndUser
        customers_path
    end
  end


  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:family_name,:first_name_kana,:family_name_kana,:zip_code,:address,:phone_number])
  end
end
