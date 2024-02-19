class ApplicationController < ActionController::Base
  include Pundit::Authorization
  include ErrorHandler
  include PunditHelper
  include ErrorDefinations

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[
                                                        status
                                                        last_name
                                                        terms_and_conditions])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name])
  end

end
