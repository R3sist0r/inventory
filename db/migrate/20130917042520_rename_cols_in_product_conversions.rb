class RenameColsInProductConversions < ActiveRecord::Migration
  def change
  	rename_column :product_conversions, :item_id, :product_id
  	rename_column :product_conversions, :contains_item_id, :contains_product_id
  end
end
