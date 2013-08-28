class AddBaseUnitToUoms < ActiveRecord::Migration
  def change
    add_column :uoms, :base_unit, :string
  end
end
