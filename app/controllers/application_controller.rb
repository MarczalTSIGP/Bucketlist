class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :layout_by_resource

  protected
  def layout_by_resource
    if devise_controller?
      if resource_name == :user && ['edit', 'update'].include?(action_name)
        "users/layouts/application"
      elsif resource_name == :admin && not(['new', 'create'].include?(action_name))
        "admins/layouts/application"
      else
        "layouts/session"
      end
    else
      "layouts/application"
    end
  end

  def after_sign_in_path_for(resource)
    return admins_root_path if resource.is_a?(Admin)
    users_root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :user
      new_user_session_path
    elsif resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
