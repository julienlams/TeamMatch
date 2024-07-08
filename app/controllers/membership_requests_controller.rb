class MembershipRequestsController < ApplicationController
  def approve
    membership_request = MembershipRequest.find(params[:id])
    membership_request.status = 'approved'

    if membership_request.save
      # Ajouter l'utilisateur à l'équipe
      membership_request.team.users << membership_request.user

      # Diffuser la notification à l'utilisateur approuvé
      NotificationChannel.broadcast_to(
        membership_request.user,
        title: 'Demande d\'inscription approuvée',
        body: "Votre demande pour rejoindre l'équipe #{membership_request.team.name} a été approuvée."
      )

      redirect_to membership_request.team.competition, notice: 'Demande d\'inscription approuvée.'
    else
      redirect_to membership_request.team.competition, alert: 'L\'approbation de la demande a échouée.'
    end
  end
end
