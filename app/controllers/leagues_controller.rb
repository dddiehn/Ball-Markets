class LeaguesController < ApplicationController
  respond_with :html
  def index
    @leagues = League.all

    render :index
  end

  def show
    @league = League.find(params[:id])
    @teams = @league.teams

    render :show
  end

  def new
    @league = League.new()
  end

  def create

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
