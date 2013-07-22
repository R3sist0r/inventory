class InvoiceLine < ActiveRecord::Base
  attr_accessible :invoice_id, :quantity, :product_id
  belongs_to :invoice
  belongs_to :product
end
