require 'pry-byebug'

class ConsultationsController < ApplicationController
  before_action :check_user

  before_action :set_consultations, except: [:new, :create]
  before_action :set_consultation, only: [:show, :edit, :update, :destroy]

  def index
    set_upcoming_consultations
    set_past_consultations
    set_pending_consultations
    set_cancelled_consultations
    binding.pry
  end

  def show
    if @consultations.include?(@consultation)
      @consultation
      @datetime_start
      @datetime_end
      @availability
    else
      redirect_to consultations_path
      flash[:notice] = "You are not allowed to access this consultation"
    end
  end

  def new
    if @user.class == User
      @consultation = Consultation.new
      if params[:search].present?
        id = params[:search].values()
        binding.pry
        @available_doctors = Availability.where('id = ? ', id)
      end
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

  def compute_dates(consultation)
    @availability = consultation.availability
    @datetime_start = DateTime.new(@availability.date_start_year, @availability.date_start_month, @availability.date_start_day, @availability.time_start_hour, @availability.time_start_minutes)

    @datetime_end = DateTime.new(@availability.date_end_year, @availability.date_end_month, @availability.date_end_day, @availability.time_end_hour, @availability.time_end_minutes)
  end

  def set_upcoming_consultations
    @upcoming_consultations = @consultations.select do |consultation|
      compute_dates(consultation)
      true if (consultation.status == "confirmed") && ((@datetime_start && @datetime_end) > DateTime.now)
    end
  end

  def set_past_consultations
    @past_consultations = @consultations.select do |consultation|
      compute_dates(consultation)
      true if (consultation.status == "confirmed") && ((@datetime_start && @datetime_end) < DateTime.now)
    end
  end

  def set_cancelled_consultations
    @cancelled_consultations = @consultations.select do |consultation|
      true if consultation.status == "cancelled"
    end
  end

  def set_pending_consultations
    @pending_consultations = @consultations.select do |consultation|
      true if consultation.status == "pending"
    end
  end

  def set_consultations
    @consultations = @user.consultations
  end

  def set_consultation
    @consultation = Consultation.find(params[:id])
    compute_dates(@consultation)
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
