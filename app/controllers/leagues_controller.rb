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

  def graph_data
    league = League.find(params[:id])
    data = {}

    TeamWeek.joins(:team)
            .where(team: {league_id: params[:id]})
            .where('extract(day   from start_date) = ?')
            .where('extract(month from start_date) = ?')
            .where('extract(year  from start_date) = ?')

    # http://stackoverflow.com/questions/9624601/activerecord-find-by-year-day-or-month-on-a-date-field
    # Model.where('extract(year  from date_column) = ?', desired_year)
    # Model.where('extract(month from date_column) = ?', desired_month)
    # Model.where('extract(day   from date_column) = ?', desired_day_of_month)

    respond_to do |format|
      format.json{ render json: data.to_json }
    end
  end

private

  def league_params
    params.require(:league).permit(:name, :sport)
  end
end
