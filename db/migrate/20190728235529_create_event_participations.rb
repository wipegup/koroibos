class CreateEventParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :event_participations do |t|
      t.references :athlete, foreign_key: true
      t.references :game
      t.integer :medal

      t.timestamps
    end
  end
end
