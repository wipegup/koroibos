class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :season
      t.integer :year

      t.timestamps
    end
  end
end
