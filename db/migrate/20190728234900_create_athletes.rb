class CreateAthletes < ActiveRecord::Migration[5.2]
  def change
    create_table :athletes do |t|
      t.string :name
      t.integer :sex
      t.integer :height
      t.integer :weight
      t.string :team
      t.references :sport, foreign_key: true

      t.timestamps
    end
  end
end
