class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @competitions = Competition
                      .left_joins(:teams)
                      .group('competitions.id')
                      .order('COUNT(teams.id) DESC')
                      .limit(6)
  end
end
