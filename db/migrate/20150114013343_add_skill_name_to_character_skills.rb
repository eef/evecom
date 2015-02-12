class AddSkillNameToCharacterSkills < ActiveRecord::Migration
  def change
    add_column :skills, :name, :string
  end
end
