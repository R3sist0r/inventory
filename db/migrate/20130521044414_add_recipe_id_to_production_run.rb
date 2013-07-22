class AddRecipeIdToProductionRun < ActiveRecord::Migration
  def change
    add_column :production_runs, :recipe_id, :integer
  end
end
