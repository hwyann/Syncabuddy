class AttendancesController < ApplicationController
  before_action :set_attendance, only: :destroy
  def destroy
    @attendance.destroy
    redirect_to user_path(@attendance.user), notice: 'Restaurant was successfully destroyed.'
  end

  private

  def set_attendance
    @attendance = Attendance.find(params[:id])
    authorize @attendance
  end
end
