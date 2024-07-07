<<<<<<< HEAD
class CompetitionController < ApplicationController
    before_action :set_competition, only: [:show, :edit, :update, :destroy]
    skip_before_action :authenticate_user!, only: :index

    def index
      @competitions = Competition.all
      if params[:query].present?
        @competitions = @competitions.where("address ILIKE ?", "%#{params[:query]}%")
      end
    end

    def show
      @competition = Competition.find(params[:id])
    end

    def new
      @competition = Competition.new
      @sports = Sport.all  # Pour remplir le menu déroulant des sports
    end

    def create
      @competition = Competition.new(competition_params)
      @competition.user = current_user
      if @competition.save
        redirect_to @competition, notice: 'La compétition a été créée avec succès.'
      else
        @sports = Sport.all
        render :new
      end
    end

    def edit
    end

    def update
      if @competition.update(competition_params)
        redirect_to @competition, notice: 'La compétition a été mise à jour avec succès.'
      else
        render :edit
      end
    end

    def destroy
      if @competition.user == current_user
        @competition.destroy
        redirect_to competitions_path, notice: 'Compétition supprimée avec succès.'
      else
        redirect_to competitions_path, alert: 'Vous n\'êtes pas autorisé à supprimer cette compétition.'
      end
    end

    private

    def set_competition
      @competition = Competition.find(params[:id])
    end

    def competition_params
      params.require(:competition).permit(:name, :description, :date_time, :latitude, :longitude, :address, :number_of_teams, :sport_id, :user_id)
    end
  end

=======
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
>>>>>>> master
end
