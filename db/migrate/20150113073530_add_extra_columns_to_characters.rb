class AddExtraColumnsToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :corporation, :string
    add_column :characters, :corporation_date, :datetime
  end
end
