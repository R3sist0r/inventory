class AddTotalUsedToProductionRunIngredients < ActiveRecord::Migration
  def change
    add_column :production_run_ingredients, :TotalUsed, :Float
  end
end
