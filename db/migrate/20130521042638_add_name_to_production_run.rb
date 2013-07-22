class AddNameToProductionRun < ActiveRecord::Migration
  def change
    add_column :production_runs, :name, :string
  end
end
