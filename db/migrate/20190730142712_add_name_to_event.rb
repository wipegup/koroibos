class AddNameToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :name, :string
  end
end
