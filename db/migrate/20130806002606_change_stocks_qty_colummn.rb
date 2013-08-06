class ChangeStocksQtyColummn < ActiveRecord::Migration
  def change
  	change_column :raw_materials_stocks, :qty, :string
  end
end
