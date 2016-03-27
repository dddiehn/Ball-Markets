class TeamWeek < ActiveRecord::Base
  resourcify

  belongs_to :team

  validates :team,   presence: true
  validates :date,   presence: true
  validates :season, presence: true
  validates :week,   presence: true

  validates :date, uniqueness: {scope: :team, message: "Date has already been picked"}

  def import_csv
    # http://stackoverflow.com/questions/4410794/ruby-on-rails-import-data-from-a-csv-file

    require 'csv'

    csv_text = File.read('')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      TeamWeek.create!(row.to_hash)
    end
  end
end
