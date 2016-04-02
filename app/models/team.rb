class Team < ActiveRecord::Base
  resourcify
  belongs_to :league
  has_many :team_weeks

  validates :league, presence: true
  validates :name,   presence: true
  validates :name,   uniqueness: {scope: :league, message: "This team already exists in this league"}

  def current_rating
    self.team_weeks.order(:start_date).first
  end

  def self.team_import(league_id, csv)
    # http://stackoverflow.com/questions/4410794/ruby-on-rails-import-data-from-a-csv-file
    # Team.team_import(1, 'public/NFLnames.csv')
    require 'csv'
    ActiveRecord::Base.transaction do
      csv_text = File.read(csv)
      csv = CSV.parse(csv_text, :headers => true)
      csv.each do |row|
        attributes = row.to_hash
        attributes[:league_id] = league_id
        Team.create!(attributes)
      end
  end
  end
end
