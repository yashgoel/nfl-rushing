class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :player
      t.string :team
      t.string :position
      t.float :avg_attempts_per_game
      t.integer :total_attempts
      t.integer :total_yards
      t.float :average_yards_per_attempt
      t.float :yards_per_game
      t.integer :total_touchdowns
      t.string :longest_rush
      t.integer :first_downs
      t.float :first_down_percentage
      t.integer :twenty_yards_plus_each
      t.integer :forty_yards_plus_each
      t.integer :fumbles

      t.timestamps
    end
  end
end
