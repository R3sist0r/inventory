class Product < ActiveRecord::Base
  attr_accessible :title, :description, :recipe_id, :name
  has_many :packing_runs
  belongs_to :recipe
  has_many :invoices, :through => :invoice_line

end
