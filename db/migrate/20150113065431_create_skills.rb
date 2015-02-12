class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.integer :skill_book_id
      t.integer :skill_points
      t.integer :level
      t.integer :character_id
      t.integer :skill_book_group_id

      t.timestamps
    end
  end
end

