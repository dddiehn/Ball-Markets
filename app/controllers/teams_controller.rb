class TeamsController < ApplicationController
  respond_to :html, :json, :js

  def new
    @team = Team.new()
    @league = League.find(params[:league_id])
  end

  def create
    @league = League.find(params[:league_id])
    @team   = @league.teams.create(league_params)

    respond_with(@league, @team)
  end

  def show
    @team = Team.find(params[:id])
    @league = League.find(params[:league_id])
  end
private

  def league_params
    params.require(:team).permit(:name)
  end

end
