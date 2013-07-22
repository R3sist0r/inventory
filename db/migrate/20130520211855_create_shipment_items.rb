class CreateShipmentItems < ActiveRecord::Migration
  def change
    create_table :shipment_items do |t|
      t.integer :carton_id
      t.integer :invoice_line_id

      t.timestamps
    end
  end
end
