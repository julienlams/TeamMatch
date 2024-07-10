class TeamsController < ApplicationController
  before_action :set_competition, only: [:new, :create]

  def new
    @team = @competition.teams.new
  end

  def create
    @team = @competition.teams.new(team_params)
    @team.user = current_user # Assigner le créateur de l'équipe

    if @team.save
      redirect_to @competition, notice: 'Équipe ajoutée avec succès.'
    else
      render :new
    end
  end

  def register
    @team = Team.find(params[:id])
    @competition = Competition.find(params[:competition_id])
    @team.user = current_user

    membership_request = MembershipRequest.new(user: current_user, team: @team, status: 'pending')

    if membership_request.save
      NotificationChannel.broadcast_to(
        @team.user,
        title: 'Nouvelle demande d\'inscription',
        body: "#{current_user.name} souhaite rejoindre votre équipe #{@team.name}!"
      )
      redirect_to @competition, notice: 'Votre demande de "Match" a été envoyée au créateur de l\'équipe.'
    else
      redirect_to @competition, alert: 'La demande de "Match" a échouée.'
    end
  end

  private

  def set_competition
    @competition = Competition.find(params[:competition_id])
  end

  def team_params
    params.require(:team).permit(:name, :number_max_of_participants)
  end
end
