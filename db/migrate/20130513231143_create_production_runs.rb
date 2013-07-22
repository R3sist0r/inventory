class CreateProductionRuns < ActiveRecord::Migration
  def change
    create_table :production_runs do |t|
      t.date :production_date
      t.date :expiration_date

      t.timestamps
    end
  end
end
