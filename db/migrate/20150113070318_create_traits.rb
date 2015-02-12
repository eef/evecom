class CreateTraits < ActiveRecord::Migration
  def change
    create_table :traits do |t|
      t.integer :intelligence
      t.integer :memory
      t.integer :charisma
      t.integer :willpower
      t.integer :perception
      t.integer :character_id

      t.timestamps
    end
  end
end

