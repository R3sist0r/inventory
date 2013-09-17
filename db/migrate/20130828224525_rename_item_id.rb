class RenameItemId < ActiveRecord::Migration
  def change
  	rename_column :recipes_raw_materials, :raw_material_id, :item_id
  end
end
