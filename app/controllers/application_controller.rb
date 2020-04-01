require "application_responder"
require 'users/user_parameter_sanitizer.rb'
require 'doctors/doctor_parameter_sanitizer.rb'


class ApplicationController < ActionController::Base
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  rescue
    render_404
  end

  def render_404
    render file: "errors/error_404", status: :not_found
  end

  def internal_server_error
    raise ActionController::RoutingError.new('Internal Server Error')
  rescue
    render_internal_server_error
  end

  def render_internal_server_error
    render file: "errors/error_500", status: :internal_server_error
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
