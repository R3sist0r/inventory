class RenameRecievedDate < ActiveRecord::Migration
  def change
  	rename_column :raw_materials_stocks, :RecievedDate, :recieved_date
  end
end
