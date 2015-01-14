class AddColumnsToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :skill_points, :integer
    add_column :characters, :next_training_ends, :datetime
    add_column :characters, :ship_name, :string
    add_column :characters, :ship_type_id, :integer
    add_column :characters, :ship_type_name, :string
    add_column :characters, :last_known_location, :string
    add_column :characters, :security_status, :float
  end
end
