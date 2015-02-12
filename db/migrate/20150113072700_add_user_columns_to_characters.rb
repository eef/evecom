class AddUserColumnsToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :user_id, :integer
    add_column :characters, :active, :boolean, :default => false
  end
end
