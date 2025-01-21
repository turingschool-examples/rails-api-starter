class Api::V1::UserSchedulesController < ApplicationController

  def index
    user = User.find_by(id: params[:user_id])
    if user.nil?
      render json: { error: "User not found" }, status: :not_found
    else
      schedules = user.schedules.includes(:shows)
      render json: ScheduleSerializer.new(schedules).to_json
    end
  end
end
