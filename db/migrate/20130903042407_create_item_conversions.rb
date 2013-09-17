class CreateItemConversions < ActiveRecord::Migration
  def change
  	create_table(:item_conversions) do |t|
  		t.integer :item_id
  		t.integer :composite_item_id

	end

  end
end
