class FixColumnTypes < ActiveRecord::Migration[5.0]
  def change
    change_column :players, :longest_rush, :integer
  end
end
