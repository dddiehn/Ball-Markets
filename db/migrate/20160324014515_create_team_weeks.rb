class CreateTeamWeeks < ActiveRecord::Migration
  def change
    create_table :team_weeks do |t|
      t.integer :team_id

      t.datetime :start_date
      t.integer :season
      t.integer :week
      t.integer :rating

      t.timestamps null: false
    end
  end
end
