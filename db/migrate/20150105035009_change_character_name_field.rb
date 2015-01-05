class ChangeCharacterNameField < ActiveRecord::Migration
  def change
    rename_column :characters, :name, :character_name
  end
end
