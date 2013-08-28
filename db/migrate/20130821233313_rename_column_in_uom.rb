class RenameColumnInUom < ActiveRecord::Migration
  def change
  	rename_column :uoms, :abbrevian, :abbreviation
  end
end
