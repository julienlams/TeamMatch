class CompetitionsController < ApplicationController
  def index
    @competitions = Competition.all
  end

  def new
    @competition = Competition.new
    @sports = Sport.all  # Pour remplir le menu déroulant des sports
  end

  def create
    @competition = Competition.new(competition_params)
    if @competition.save
      redirect_to @competition, notice: 'Competition was successfully created.'
    else
      @sports = Sport.all
      render :new
    end
  end

  def show
    @competition = Competition.find(params[:id])
  end

  private

  def competition_params
    params.require(:competition).permit(:sport_id, :number_of_teams, :date_time, :address, :name)
  end
end
