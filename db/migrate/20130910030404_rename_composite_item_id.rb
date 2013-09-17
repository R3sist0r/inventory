class RenameCompositeItemId < ActiveRecord::Migration
  def change
  	rename_column :item_conversions, :composite_item_id, :contains_item_id
  end
end
