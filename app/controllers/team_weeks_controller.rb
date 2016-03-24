class TeamWeeksController < ApplicationController
  respond_to :html, :json, :js
  def new
    @league    = League.find(params[:league_id])
    @team      = Team.find(params[:team_id])
    @team_week = TeamWeek.new()
  end

  def create
    @league = League.find(params[:league_id])
    @team   = Team.find(params[:team_id])

    @team_week = @team.team_weeks.create(team_week_params)

    respond_with(@league, @team)
  end

private
  def team_week_params
    params.require(:team_week).permit(:team_id, :start_date, :season, :week, :rating)
  end

end
