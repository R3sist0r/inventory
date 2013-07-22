class CreateInvoiceLines < ActiveRecord::Migration
  def change
    create_table :invoice_lines do |t|

      t.timestamps
    end
  end
end
