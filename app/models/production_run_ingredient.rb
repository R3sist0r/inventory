class ProductionRunIngredient < ActiveRecord::Base
  attr_accessible :production_run_id, :raw_materials_stock_id, :adjustment_qty
  belongs_to :production_run, :foreign_key => :production_run_id
end
