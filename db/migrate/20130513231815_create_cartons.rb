class CreateCartons < ActiveRecord::Migration
  def change
    create_table :cartons do |t|
      t.integer :packing_run_id
      t.string :barcode

      t.timestamps
    end
  end
end
