class CreateMarketItems < ActiveRecord::Migration
  def change
    create_table :market_items do |t|
      t.integer :group_id
      t.string :name
      t.text :description
      t.float :mass
      t.float :value
      t.float :capacity
      t.integer :portion_size
      t.integer :race_id
      t.decimal :base_price, :precision => 19, :scale => 4
      t.boolean :published
      t.integer :market_group_id
      t.float :chance_of_duplicating
      t.integer :icon_id

      t.timestamps
    end
  end
end
