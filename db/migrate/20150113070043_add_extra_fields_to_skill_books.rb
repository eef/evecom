class AddExtraFieldsToSkillBooks < ActiveRecord::Migration
  def change
    add_column :skill_books, :rank, :integer
    add_column :skill_books, :primary_attribute, :string
    add_column :skill_books, :secondary_attribute, :string
  end
end
