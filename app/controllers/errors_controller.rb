class ErrorsController < ApplicationController

  def error_404
    @requested_path = request.path
    respond_to do |format|
      format.html
      format.json { render json: {routing_error: @requested_path} }
    end
  end

  def error_500
    
  end
end
