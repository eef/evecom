class CreateAttrTypes < ActiveRecord::Migration
  def change
    create_table :attr_types do |t|

      t.string :name
      t.text   :description
      t.integer :icon_id
      t.integer :default_value
      t.boolean :published
      t.string  :display_name
      t.integer :unit_id
      t.boolean :stackable
      t.boolean :high_is_good
      t.integer :category_id

      t.timestamps
    end
  end
end
