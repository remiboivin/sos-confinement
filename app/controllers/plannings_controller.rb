class PlanningsController < ApplicationController
  before_action :authenticate_volunteer!

  def index
    @user_plannings = sort_plannings(current_volunteer.plannings)
    @plannings = sort_plannings(Planning.all)
  end

  def new
    @planning = Planning.new
  end

  def create
    @planning = Planning.new(params_planning)
    @planning.volunteer = current_volunteer
    @planning.date_start = @planning.date_start.to_date
    @planning.date_end = @planning.date_start.to_date
    @planning.time_start = @planning.time_start.to_time
    @planning.time_end = @planning.time_end.to_time
    if @planning.save
      redirect_to plannings_path
    else
      render :new
    end
  end

  def destroy
    @planning = Planning.find(params[:id])
    if @planning.destroy
      redirect_to plannings_path
    else
      redirect_to planning_path(@planning)
    end
  end

  private

  def sort_plannings(plannings)
    sorted_plannings = plannings.sort_by do |planning|
      planning.date_start
    end
  end

  def params_planning
    params.require(:planning).permit(:volunteer, :date_start, :date_end, :time_start, :time_end)
  end
end
