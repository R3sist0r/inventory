class RenameItemColToRawMaterial < ActiveRecord::Migration
  def change
  	rename_column :recipes_raw_materials, :item_id, :raw_material_id
  end
end
