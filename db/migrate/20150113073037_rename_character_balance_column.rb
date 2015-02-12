class RenameCharacterBalanceColumn < ActiveRecord::Migration
  def change
    rename_column :characters, :balance, :account_balance
  end
end
