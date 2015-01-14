class CreateImplants < ActiveRecord::Migration
  def change
    create_table :implants do |t|
      t.string :type
      t.string :name
      t.integer :value
      t.integer :character_id

      t.timestamps
    end
  end
end

