class AddColumnsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :physical_measure, :string
    add_column :products, :physical_meaning, :boolean
    add_column :products, :parent_id, :integer
    add_column :products, :link_type, :string
    add_column :products, :base_unit, :string
    add_column :products, :conversion, :decimal
  end
end
