class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:destroy, :update]

  def create
    @attendance = Attendance.new
    @user = current_user
    @match = Match.find(params[:match_id])
    @attendance.user = @user
    @attendance.match = @match
    authorize @attendance
    if @attendance.save
      redirect_to user_path(current_user)
    else
      render "matches/#{@match.id}"
    end
  end

  def update
    @attendance.status = 'confirmed'
    if @attendance.save
      redirect_to user_path(current_user)
    else
      render "matches/#{@match.id}"
    end
  end

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
