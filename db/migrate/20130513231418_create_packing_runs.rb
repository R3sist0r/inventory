class CreatePackingRuns < ActiveRecord::Migration
  def change
    create_table :packing_runs do |t|
      t.date :packing_date
      t.integer :product_id
      t.integer :production_run_id

      t.timestamps
    end
  end
end
