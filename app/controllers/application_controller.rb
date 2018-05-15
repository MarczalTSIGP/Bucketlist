class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :layout_by_resource

  protected
  def layout_by_resource
    if devise_controller?
      if resource_name == :user && ['edit', 'update'].include?(action_name)
        return "users/layouts/application"
      end
      return "layouts/session"
    end

    "layouts/application"
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
