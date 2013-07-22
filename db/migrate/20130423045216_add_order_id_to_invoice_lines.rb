class AddOrderIdToInvoiceLines < ActiveRecord::Migration
  def change
    add_column :invoice_lines, :invoice_id, :integer
    add_column :invoice_lines, :product_id, :integer
  end
end
