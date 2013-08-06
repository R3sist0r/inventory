class RawMaterial < ActiveRecord::Base
  attr_accessible :name
  has_many :recipes_raw_materials
  has_many :recipes, :through => :recipes_raw_materials
  has_many :raw_materials_stocks 
  attr_reader :qty

  def qty
    quantity = 0
  	RawMaterialsStock.where(:raw_material_id => id).each do |stock|
  		quantity = quantity + stock.qty
  	end
  	quantity
  end
end
