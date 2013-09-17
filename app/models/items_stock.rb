class ItemsStock < ActiveRecord::Base
  attr_accessible :qty, :item_id, :batch_code, :recieved_date
  belongs_to :item

  before_save :convert_quantity

  def convert_quantity
    self.qty = Unit.new(self.qty).to_s
    # false
  end
end
