class LeaguesController < ApplicationController
  respond_to :html, :json, :js
  def index
    @leagues = League.all

    render :index
  end

  def show
    @league = League.find(params[:id])
    @teams = {}
    @league.teams.map{|t| @teams[t] = t.current_rating}

    render :show
  end

  def new
    @league = League.new()
  end

  def create
    @league = League.create(league_params)
    respond_with(@league)
  end

  def edit

  end

  def update

  end

  def destroy

  end

private

  def league_params
    params.require(:league).permit(:name, :sport)
  end
end
