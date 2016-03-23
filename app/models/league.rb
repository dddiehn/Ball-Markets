class League < ActiveRecord::Base
  has_many :teams

  def self.sports
    ["Football", "Basketball", "Hockey", "Baseball", "Soccer"].sort
  end

  def update_league(path)
    
  end
end
