class AddQuantityToInvoiceLine < ActiveRecord::Migration
  def change
    add_column :invoice_lines, :quantity, :integer
  end
end
