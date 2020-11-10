class UsersController < ApplicationController
  # skip_before_action :authenticate_user!, only: :show

  def show
    raise
    @user = User.find(params[:id])
    authorize @user
  end
end

