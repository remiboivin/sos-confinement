class ErrorsController < ApplicationController

  def page_not_found
    respond_to do |format|
      format.html{ render :template=>'errors#error_404', :status => 404 }
      format.xml{  render :xml => 'Page Not Found',             :status => 404 }
      format.json{ render :json => 'Page Not Found',            :status => 404 }
    end
  end

  def error_500
    
  end
end
