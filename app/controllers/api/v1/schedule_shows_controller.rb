class Api::V1::ScheduleShowsController < ApplicationController
  
  def show
    schedule = Schedule.find_by(id: params[:schedule_id])
    if schedule.nil?
      render json: { error: "Schedule not found" }, status: :not_found
    else
      show = schedule.shows.find_by(id: params[:id])
      if show.nil?
        render json: { error: "Show not found in this schedule" }, status: :not_found
      else
        render json: ShowSerializer.new(show).to_json
      end
    end
  end
  
  def destroy
    schedule = Schedule.find_by(id: params[:schedule_id])

    if schedule.nil?
      render json: { error: "Schedule not found" }, status: :not_found
    elsif !schedule.remove_show(params[:id])
      render json: { error: "Show not found in the schedule" }, status: :not_found
    else
      render json: { message: "Show successfully removed from the schedule" }, status: :ok
    end
  end
end
