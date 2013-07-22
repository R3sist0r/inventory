class AddRecipeIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :recipe_id, :integer
  end
end
