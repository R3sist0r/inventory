class CreateRecipesRawMaterials < ActiveRecord::Migration
  def change
    create_table :recipes_raw_materials do |t|
      t.integer :recipe_id
      t.integer :raw_material_id
      t.integer :quantity
      t.string :unit

      t.timestamps
    end
  end
end
