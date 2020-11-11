class MatchesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @matches = policy_scope(Match)
    @markers = @matches.geocoded.map do |match|
      {
        lat: match.latitude,
        lng: match.longitude
      }
    end
  end

  def show
    @attendance = Attendance.new
    @match = Match.find(params[:id])
    authorize @match
  end
end
