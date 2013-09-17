class ItemConversion < ActiveRecord::Base
  attr_accessible :contains_item_id, :conversion
  belongs_to :item
  belongs_to :contains_item, :class_name => "Item"



end
