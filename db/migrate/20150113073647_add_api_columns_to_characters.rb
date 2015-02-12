class AddApiColumnsToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :api_id, :integer
    add_column :characters, :api_vcode, :string
  end
end
