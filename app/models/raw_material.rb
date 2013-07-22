class RawMaterial < ActiveRecord::Base
  attr_accessible :name
  has_many :recipes_raw_materials
  has_many :recipes, :through => :recipes_raw_materials
  has_many :raw_materials_stocks 
end
