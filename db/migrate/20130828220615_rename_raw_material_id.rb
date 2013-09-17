class RenameRawMaterialId < ActiveRecord::Migration
  def change
  	rename_column :items_stocks, :raw_material_id, :item_id
  end
end
