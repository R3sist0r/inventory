class RenameItemsTables < ActiveRecord::Migration
  def change
  	rename_table :items, :products
  	rename_table :items_stocks, :products_stocks
  	rename_table :item_conversions, :product_conversions
  end
end
