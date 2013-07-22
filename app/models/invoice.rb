class Invoice < ActiveRecord::Base
  attr_accessible :name, :invoice_lines_attributes
  has_many :invoice_lines

  accepts_nested_attributes_for :invoice_lines, :allow_destroy => true

  has_many :products, :through => :invoice_lines

end
