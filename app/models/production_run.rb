class ProductionRun < ActiveRecord::Base
  attr_accessible :expiration_date, :production_date, :name, :recipe_id
  has_many :packing_runs
  belongs_to :recipe
  has_many :production_run_ingredients, :dependent => :destroy
  accepts_nested_attributes_for :production_run_ingredients, :allow_destroy => true
end
