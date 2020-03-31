class AlertsController < ApplicationController
  
  def new
    @alert = 
  end

  def index
  
  end

  def create
   @patient = Patient.create(name: params[:name], first_name: params[:first_name], email: params[:email], phone: params[:phone], comment: params[:comment])
  end

  def edit
    
  end

  def delete
  end

end
