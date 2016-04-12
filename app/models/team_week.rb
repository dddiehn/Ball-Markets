class TeamWeek < ActiveRecord::Base
  resourcify

  belongs_to :team

  validates :team,       presence: true
  validates :start_date, presence: true
  validates :season,     presence: true
  validates :week,       presence: true

  validates :start_date, uniqueness: {scope: :team, message: "Date has already been picked"}

  def self.team_week_import(league_id, csv_path, start_date, week, season)
    # http://stackoverflow.com/questions/4410794/ruby-on-rails-import-data-from-a-csv-file
    # TeamWeek.team_week_import(1, 'public/week7/week7.csv')
    # TeamWeek(id: integer, team_id: integer, start_date: datetime, season: integer, week: integer, rating: integer, created_at: datetime, updated_at: datetime)
    require 'csv'

    ActiveRecord::Base.transaction do
      begin
        csv_text = File.read(csv_path)
        csv = CSV.parse(csv_text, :headers => true)
        csv.each do |row|
          # TeamWeek.create!(row.to_hash)

          attributes = row.to_hash
          attributes[:team_id]    = Team.find_by!(league_id: league_id, name: attributes["name"]).id

          attributes.delete("name")
          attributes.delete(nil)

          attributes[:start_date] = start_date
          attributes[:season]     = season
          attributes[:week]       = week

          puts attributes
          TeamWeek.create!(attributes)

        end
      rescue
        raise ActiveRecord::Rollback
      end
    end

    #
    # # http://stackoverflow.com/questions/4410794/ruby-on-rails-import-data-from-a-csv-file
    # # Team.team_import(1, 'public/NFLnames.csv')
    # require 'csv'
    # csv_text = File.read(csv)
    # csv = CSV.parse(csv_text, :headers => true)
    # csv.each do |row|
    #   attributes = row.to_hash
    #   attributes[:league_id] = league_id
    #   Team.create!(attributes)
    # end




  end
end
