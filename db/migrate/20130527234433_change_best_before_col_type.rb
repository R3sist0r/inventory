class ChangeBestBeforeColType < ActiveRecord::Migration
  def up
    change_column :packing_runs, :best_before, :date
  end

  def down
    change_column :packing_runs, :best_before, :datetime
  end
end
