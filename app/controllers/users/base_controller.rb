class Users::BaseController < ActionController::Base
  protect_from_forgery with: :exception
  layout 'users/layouts/application'
end
