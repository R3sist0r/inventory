class CreateRawMaterialsStocks < ActiveRecord::Migration
  def change
    create_table :raw_materials_stocks do |t|
      t.integer :raw_materials_id
      t.integer :qty

      t.timestamps
    end
  end
end
