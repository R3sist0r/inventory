class ShipmentItem < ActiveRecord::Base
  attr_accessible :carton_id, :invoice_line_id
end
