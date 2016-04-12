class CreateLeagueWeeks < ActiveRecord::Migration
  def change
    create_table :league_weeks do |t|
      t.integer :league_id

      t.datetime :start_date
      t.integer :season
      t.integer :week

      t.timestamps null: false
    end

    remove_column :team_weeks, :start_date
    remove_column :team_weeks, :season_week
    remove_column :team_weeks, :week

    add_column :team_weeks, :league_week_id, :integer

  end
end
