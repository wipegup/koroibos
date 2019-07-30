class AddAgeToAthlete < ActiveRecord::Migration[5.2]
  def change
    add_column :athletes, :age, :integer
  end
end
