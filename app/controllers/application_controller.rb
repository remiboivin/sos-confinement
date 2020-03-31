require "application_responder"

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
end
