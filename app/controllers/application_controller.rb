require "application_responder"
require_relative 'users/user_parameter_sanitizer'
require_relative 'doctors/doctor_parameter_sanitizer'

include ActionController::MimeResponds

class ApplicationController < ActionController::Base

  self.responder = ApplicationResponder
  respond_to :html
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to main_app.root_url, :alert => exception.message }
    end
  end

  protected

  def devise_parameter_sanitizer
    if resource_class == User
      User::ParameterSanitizer.new(User, :user, params)
    elsif resource_class == devise
      Doctor::ParameterSanitizer.new(Doctor, :doctor, params)
    else
      super # Use the default one
    end
  end
end
