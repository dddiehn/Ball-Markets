class Team < ActiveRecord::Base
 belongs_to :league
 has_many :team_weeks

 validates :league, presence: true
 validates :name,   presence: true
end
