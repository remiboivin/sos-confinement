class ConsultationsController < ApplicationController
  before_action :check_user

  before_action :set_consultations, except: [:new, :create]
  before_action :set_consultation, only: [:show, :edit, :update, :destroy]


  def index
    set_upcoming_consultations
    set_past_consultations
    set_declined_consultations
    set_pending_consultations
    set_cancelled_consultations
  end

  def show
    if @consultations.include?(@consultation)
      @consultation
    else
      redirect_to consultations_path
      flash[:notice] = "You are not allowed to access this consultation"
    end
  end

  def new
    if @user.class == User
      @consultation = Consultation.new
    else
      redirect_to consultations_path
    end
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
      @consultation
    else
      redirect_to consultations_path
      flash[:notice] = "You are not allowed to edit this consultation"
    end
  end

  def update
    if @consultations.include?(@consultation)
      if @consultation.update(params_consultation)
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

  def decline
    @consultation = Consultation.find(params[:consultation_id])

    if @consultations.include?(@consultation) && @user.class == Doctor
      @consultation.status = "declined"
      if @consultation.save
        redirect_to consultations_path
      else
        redirect_to consultation_path(@consultation)
        flash[:notice] = "Something went wrong! Consultation not saved!"
      end
    else
      redirect_to consultations_path
      flash[:notice] = "You are not allowed to decline this consultation"
    end
  end

  def cancel
    @consultation = Consultation.find(params[:consultation_id])

    if @consultations.include?(@consultation)
      @consultation.status = "cancelled"
      if @consultation.save
        redirect_to consultations_path
      else
        redirect_to consultation_path(@consultation)
        flash[:notice] = "Something went wrong! Consultation not saved!"
      end
    else
      redirect_to consultations_path
      flash[:notice] = "You are not allowed to cancel this consultation"
    end
  end

  def confirm
    @consultation = Consultation.find(params[:consultation_id])

    if @consultations.include?(@consultation) && @user.class == Doctor
      @consultation.status = "confirmed"
      if @consultation.save
        redirect_to consultations_path
      else
        redirect_to consultation_path(@consultation)
        flash[:notice] = "Something went wrong! Consultation not saved!"
      end
    else
      redirect_to consultations_path
      flash[:notice] = "You are not allowed to confirm this consultation"
    end
  end

  private

  def set_cancelled_consultations
    @cancelled_consultations = @consultations.select {|consultation| consultation.status == "cancelled" }
  end

  def set_declined_consultations
    @declined_consultations = @consultations.select {|consultation| consultation.status == "declined" }
  end

  def set_pending_consultations
    @pending_consultations = @consultations.select {|consultation| consultation.status == "pending" }
  end

  def set_upcoming_consultations
    @upcoming_consultations = @consultations.select {|consultation| (consultation.status == "confirmed") && (consultation.datetime_start && consultation.datetime_end > DateTime.now) }
  end

  def set_past_consultations
    @past_consultations = @consultations.select {|consultation| consultation.datetime_start && consultation.datetime_end < DateTime.now }
  end

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
