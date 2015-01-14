class AddMarketItemIdToImplants < ActiveRecord::Migration
  def change
    add_column :implants, :market_item_id, :integer
  end
end
