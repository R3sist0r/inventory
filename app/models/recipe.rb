class Recipe < ActiveRecord::Base
  attr_accessible :name, :recipes_raw_materials_attributes
  has_many :products
  has_many :production_runs
  has_many :recipes_raw_materials
  # has_many :products, :conditions => "type LIKE '%RM'", :as => :raw_material
  has_many :raw_materials, :through => :recipes_raw_materials, :source => :products
  accepts_nested_attributes_for :recipes_raw_materials, :allow_destroy => true
end

# :conditions => 'item_type like "%Ingredient%"'