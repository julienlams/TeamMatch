class TeamsController < ApplicationController
  def register
    @team = Team.find(params[:id])
    @competition = Competition.find(params[:competition_id])

    membership_request = MembershipRequest.new(user: current_user, team: @team, status: 'pending')

    if membership_request.save
      # Diffuser la notification au créateur de l'équipe
      NotificationChannel.broadcast_to(
        @team.creator,
        title: 'Nouvelle demande d\'inscription',
        body: "#{current_user.name} souhaite rejoindre votre équipe #{team.name}!"
      )
      redirect_to @competition, notice: 'Votre demande de "Match" a été envoyée au créateur de l\'équipe.'
    else
      redirect_to @competition, alert: 'La demande de "Match" a échouée.'
    end
  end
end
