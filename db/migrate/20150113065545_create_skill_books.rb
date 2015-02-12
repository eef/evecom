class CreateSkillBooks < ActiveRecord::Migration
  def change
    create_table :skill_books do |t|
      t.integer :skill_book_group_id
      t.string :name
      t.text :description
      t.float :mass
      t.float :value
      t.float :capacity
      t.integer :portion_size
      t.integer :race_id
      t.decimal :base_price
      t.boolean :published
      t.integer :market_group_id
      t.float :chance_of_duplicating
      t.integer :icon_id

      t.timestamps
    end
  end
end
