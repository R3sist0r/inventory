class RawMaterial < ActiveRecord::Base
  attr_accessible :name
  has_many :recipes_raw_materials
  has_many :recipes, :through => :recipes_raw_materials
  has_many :raw_materials_stocks 
  attr_reader :qty

  def qty
    quantity = nil
  	RawMaterialsStock.where(:raw_material_id => id).each do |stock|
      if quantity != nil
  		  quantity = quantity + Unit.new(stock.qty)   
      else
        quantity = Unit.new(stock.qty)   
      end
  	end
  	quantity
  end
end