class AddColsToItem < ActiveRecord::Migration
  def change
  	add_column :items, :physical_measure, :string
    add_column :items, :physical_meaning, :boolean
    add_column :items, :parent_id, :integer
    add_column :items, :link_type, :string
    add_column :items, :base_unit, :string
    add_column :items, :conversion, :decimal
  end
end
