class AddFieldsToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :dob, :datetime
    add_column :characters, :race, :string
    add_column :characters, :bloodline, :string
    add_column :characters, :ancestry, :string
    add_column :characters, :gender, :string
    add_column :characters, :corporation_name, :string
    add_column :characters, :corporation_id, :string
    add_column :characters, :alliance_name, :string
    add_column :characters, :allience_id, :string
    add_column :characters, :faction_name, :string
    add_column :characters, :faction_id, :string
    add_column :characters, :clone_name, :string
    add_column :characters, :clone_skillpoints, :decimal, :precision => 16, :scale => 2
    add_column :characters, :balance, :decimal, :precision => 16, :scale => 2
    add_column :characters, :skill_attributes, :text
    add_column :characters, :cached_until, :datetime
  end
end
