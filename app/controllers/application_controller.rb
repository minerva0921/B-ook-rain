class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    users_path
  end

  protected

  def configure_permitted_parameters
    added_attrs = [ :email, :name, :image, :password, :password_confirmation ]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :password])
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
