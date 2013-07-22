class CreateProductionRunIngredients < ActiveRecord::Migration
  def change
  	create_table :production_run_ingredients do |t|
  		t.integer :production_run_id
  		t.integer :raw_materials_stock_id
  		t.float :adjustment_qty

	end
  end
end
