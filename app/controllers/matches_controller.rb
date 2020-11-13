class MatchesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @matches = policy_scope(Match).search_by_sport_city_description(params[:query])
      @query = params[:query]
    else
      @matches = policy_scope(Match)
    end

    @markers = @matches.geocoded.map do |match|
      {
        lat: match.latitude,
        lng: match.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { match: match })
      }
    end
  end

  def show
    @attendance = Attendance.new
    @match = Match.find(params[:id])
    authorize @match

    @marker = [{ lat: @match.latitude, lng: @match.longitude }]
  end

  def new
    @match = Match.new
    @user = current_user
    @match.user = @user
    authorize @match
  end

  def create
    @match = Match.new(matches_params)
    authorize @match
    @match.user = current_user
    if @match.save
      redirect_to matches_path
    else
      render :new
    end
  end

  private

  def matches_params
    params.require(:match).permit(:date, :description, :sport, :location, :city, :photo)
  end
end
