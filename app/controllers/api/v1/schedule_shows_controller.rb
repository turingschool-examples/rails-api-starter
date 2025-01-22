class Api::V1::ScheduleShowsController < ApplicationController
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
