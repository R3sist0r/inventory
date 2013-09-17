class RenameRawMaterialsToItems < ActiveRecord::Migration
  def change
  	rename_table :raw_materials, :items
  	rename_table :raw_materials_stocks, :items_stocks
  end
end
