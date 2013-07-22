class AddBestBeforeToPackingRuns < ActiveRecord::Migration
  def change
    add_column :packing_runs, :best_before, :datetime
  end
end
