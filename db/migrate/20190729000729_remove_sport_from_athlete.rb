class RemoveSportFromAthlete < ActiveRecord::Migration[5.2]
  def change
    remove_column :athletes, :sport_id
  end
end
