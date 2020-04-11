class PlanningsController < ApplicationController
  before_action :authenticate_volunteer!

  def index
    @user_plannings = sort_plannings(current_volunteer.plannings)
    @plannings = sort_plannings(Planning.all)
    @next_empty_time_schedule = compute_next_empty_time_schedule
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

  def compute_next_empty_time_schedule
    date = Date.today
    hour = Time.now.hour

    upcoming_plannings = @plannings.select {|planning| (planning.date_start == date && planning.time_start.hour > hour)}

    if upcoming_plannings.empty?
      next_empty_time_schedule = { date: date, hour_start: hour + 1, hour_end: hour + 2 }
    else
      i = hour + 1
      upcoming_plannings.each do |planning|
        if planning.time_start.hour == i
          i += 1
        else
          next_empty_time_schedule = { date: date, hour_start: i, hour_end: i + 1 }
        end
      end
    end

    next_empty_time_schedule
  end

  def sort_plannings(plannings)
    sorted_plannings = plannings.sort_by do |planning|
      planning.date_start
    end
  end

  def params_planning
    params.require(:planning).permit(:volunteer, :date_start, :date_end, :time_start, :time_end)
  end
end
