class ApplicationController < ActionController::Base
  include Authorizable

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [userable_attributes: [:first_name, :last_name, :cpf]])
    devise_parameter_sanitizer.permit(:account_update, keys: [userable_attributes: [:first_name, :last_name, :cpf]])
  end
end
