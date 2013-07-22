class RenameRawMaterialsIdColumn < ActiveRecord::Migration
  def change
    rename_column :raw_materials_stocks, :raw_materials_id, :raw_material_id
  end
end
