class Uom < ActiveRecord::Base
  attr_accessible :abbreviation, :conversion, :name, :parent_id, :base_unit, :uoms_attributes
  
  belongs_to :parent, :class_name => "Uom"
  has_many :uoms, :foreign_key => "parent_id"

  accepts_nested_attributes_for :uoms, :allow_destroy => true
end
