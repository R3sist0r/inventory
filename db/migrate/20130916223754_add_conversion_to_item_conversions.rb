class AddConversionToItemConversions < ActiveRecord::Migration
  def change
    add_column :item_conversions, :conversion, :decimal
  end
end
