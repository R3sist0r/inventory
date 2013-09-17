class Item < ActiveRecord::Base

  attr_accessible :name, :item_type, :physical_measure, :physical_meaning, :link_type, :base_unit, :conversion, :parent_id, :item_conversions_attributes 
  
  has_many :recipes_raw_materials
  has_many :recipes, :through => :recipes_raw_materials
  has_many :items_stocks 
  # has_many :composite_items, :class_name => "Item", :foreign_key => "parent_id"
  # belongs_to :parent, :class_name => "Item"

  has_many :item_conversions
  has_many :contains_items, through: :item_conversions, :class_name => "Item"
  # has_many :contained_in, through: :item_conversions, :foreign_key => "contains_items_id", :source => :contains_item

  has_many :inverse_conversions,  :class_name => "ItemConversion", :foreign_key => "contains_item_id"
  has_many :contained_in, :through => :inverse_conversions, :source => :item


  
  
  accepts_nested_attributes_for :contains_items, :allow_destroy => false
  accepts_nested_attributes_for :item_conversions, :allow_destroy => false


  attr_reader :qty

  # before_save :convert_quantity

  def convert_quantity
    self.qty = Unit.new(self.qty).to_s
    # false
  end

  def qty
    quantity = nil
  	ItemsStock.where(:item_id => id).each do |stock|
      if quantity != nil
  		  quantity = quantity + Unit.new(stock.qty)   
      else
        quantity = Unit.new(stock.qty)   
      end
  	end
  	quantity
  end
end
