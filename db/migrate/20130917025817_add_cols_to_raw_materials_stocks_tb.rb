class AddColsToRawMaterialsStocksTb < ActiveRecord::Migration
  def change
  	add_column :raw_materials_stocks, :batch_code, :string
	add_column :raw_materials_stocks, :RecievedDate, :Date
  end
end
