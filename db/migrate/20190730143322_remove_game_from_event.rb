class RemoveGameFromEvent < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :events, :games
    remove_column :events, :game_id
  end
end
