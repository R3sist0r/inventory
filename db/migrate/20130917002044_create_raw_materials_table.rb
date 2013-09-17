class CreateRawMaterialsTable < ActiveRecord::Migration
  def change
    create_table :raw_materials do |t|
      t.string :name

      t.timestamps
    end
  end
end
