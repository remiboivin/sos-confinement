class AvailabilitiesController < ApplicationController
  before_action :check_doctor

  before_action :set_availability, only: [:edit, :update, :destroy]

  def index
    @availabilities = current_doctor.availabilities
  end

  def new
    @availability = Availability.new
  end

  def create
    @availability = Availability.new(availability_params)
    @availability.doctor = current_doctor

    if @availability.save!
      redirect_to availabilities_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @availability.update(availability_params)
      redirect_to availabilities_path
    else
      render :edit
    end
  end

  def destroy
    if @availability.destroy
      redirect_to availabilities_path
    else
      flash[:notice] = "Something went wrong! Availability not deleted!"
    end
  end

  private

  def set_availability
    @availability = Availability.find(params[:id])
  end

  def availability_params
    params.require(:availability).permit(:doctor_id, :datetime_start, :datetime_end)
  end

  def check_doctor
    redirect_to root_path unless current_doctor
  end
end
