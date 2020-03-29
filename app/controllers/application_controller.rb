require "application_responder"
require 'users/user_parameter_sanitizer.rb'
require 'doctors/doctor_parameter_sanitizer.rb'

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
    elsif resource_class == Doctor
      Doctor::ParameterSanitizer.new(Doctor, :doctor, params)
    end
  end
end
