class AddBitMaskToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :bitmask, :integer
    add_column :characters, :key_expires, :datetime
  end
end
