class ConsultationsController < ApplicationController
  before_action :check_user

  before_action :set_consultation, only: [:edit, :update, :destroy]

  before_action :set_consultations, except: [:new, :create]

  def index
  end

  def show

    if @consultations.include?(@consultation)
      redirect_to consultation_path(@consultation)
    else
      redirect_to consultations_path
      flash[:notice] = "You are not allowed to access this consultation"
    end
  end

  def new
    @consultation = Consultation.new
  end

  def create
    @consultation = Consultation.new(params_consultation)

    if @consultation.save
      redirect_to consultation_path(@consultation)
    else
      render :new
    end
  end

  def edit
    if @consultations.include?(@consultation)
      redirect_to edit_consultation(@consultation)
    else
      redirect_to consultations_path
      flash[:notice] = "You are not allowed to edit this consultation"
    end
  end

  def update
    if @consultations.include?(@consultation)
      if @consultation.update
        redirect_to consultation_path(@consultation)
      else
        render :edit
      end
    else
      redirect_to consultations_path
      flash[:notice] = "You are not allowed to edit this consultation"
    end
  end

  def destroy
    if @consultations.include?(@consultation)
      if @consultation.destroy
        redirect_to consultations_path
      else
        redirect_to consultation_path(@consultation)
        flash[:notice] = "Something went wrong! Consultation not deleted!"
      end
    else
      redirect_to consultations_path
      flash[:notice] = "You are not allowed to delete this consultation"
    end
  end

  private

  def set_consultations
    @consultations = @user.consultations
  end

  def set_consultation
    @consultation = Consultation.find(params[:id])
  end

  def params_consultation
    params.require(:consultation).permit(:user, :doctor, :datetime_start, :datetime_end)
  end

  def check_user
    if current_doctor
      @user = current_doctor
    elsif current_user
      @user = current_user
    end
  end
end
