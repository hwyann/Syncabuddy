class MatchesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @matches = policy_scope(Match)
  end

  def show
    @match = Match.find(params[:id])
    authorize @match
  end
end
