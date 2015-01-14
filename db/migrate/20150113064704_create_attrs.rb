class CreateAttrs < ActiveRecord::Migration
  def change
    create_table :attrs do |t|
      t.integer :market_item_id
      t.integer :attr_type_id
      t.integer :value_int
      t.float :value_float

      t.timestamps
    end
  end
end
