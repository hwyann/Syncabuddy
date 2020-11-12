class MatchesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @matches = policy_scope(Match).search_by_sport_location_description(params[:query])
    else
      @matches = policy_scope(Match)
    end

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

    @marker = [{ lat: @match.latitude, lng: @match.longitude }]
  end



end
