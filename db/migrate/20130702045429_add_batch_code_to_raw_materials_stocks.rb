class AddBatchCodeToRawMaterialsStocks < ActiveRecord::Migration
  def change
    add_column :raw_materials_stocks, :batch_code, :string
  end
end
