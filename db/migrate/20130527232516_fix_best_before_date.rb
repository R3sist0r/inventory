class FixBestBeforeDate < ActiveRecord::Migration
  def change
    rename_column :production_runs, :expiration_date, :recommended_best_before
  end

end
