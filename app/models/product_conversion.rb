class ProductConversion < ActiveRecord::Base
  attr_accessible :contains_product_id, :conversion
  belongs_to :product
  belongs_to :contains_product, :class_name => "Product"



end
