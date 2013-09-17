class RemoveItemTypeFromItem < ActiveRecord::Migration
  def change
  	remove_column :items, :item_type
  end
end
