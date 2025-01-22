class Api::V1::SchedulesController < ApplicationController

  def index
    schedules = Schedule.includes(:user, :shows)
    render json: ScheduleSerializer.new(schedules).to_json
  end
end
