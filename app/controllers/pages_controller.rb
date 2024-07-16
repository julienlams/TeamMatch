class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @top_competitions = Competition.joins(:teams).group("competitions.id").order("count(teams.id) DESC").limit(3)
  end
end
