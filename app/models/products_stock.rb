class ProductsStock < ActiveRecord::Base
  attr_accessible :qty, :product_id, :batch_code, :recieved_date
  belongs_to :product

  before_save :convert_quantity

  def convert_quantity
    self.qty = Unit.new(self.qty).to_s
    # false
  end
end
