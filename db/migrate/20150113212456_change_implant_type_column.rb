class ChangeImplantTypeColumn < ActiveRecord::Migration
  def change
    rename_column :implants, :type, :implant_type
  end
end
