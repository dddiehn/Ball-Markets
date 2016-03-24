class League < ActiveRecord::Base
  has_many :teams
  has_many :team_weeks, through: :teams

  validates :name, presence: true
  validates :sport, presence: true

  def self.sports
    ["Football", "Basketball", "Hockey", "Baseball", "Soccer"].sort
  end

  def update_league(path)

  end
end
