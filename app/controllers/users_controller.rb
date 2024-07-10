class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_sports = @user.user_sports.includes(:sport)
    @owned_teams = @user.owned_teams
  end
end
