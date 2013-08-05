class AddRecievedDateToRawMaterialsStocks < ActiveRecord::Migration
  def change
    add_column :raw_materials_stocks, :RecievedDate, :Date
  end
end
