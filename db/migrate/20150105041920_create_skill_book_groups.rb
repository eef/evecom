class CreateSkillBookGroups < ActiveRecord::Migration
  def change
    create_table :skill_book_groups do |t|
      t.integer :category_id
      t.string :name
      t.text :description
      t.boolean :published

      t.timestamps
    end
  end
end
