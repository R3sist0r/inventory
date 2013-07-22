class PackingRun < ActiveRecord::Base
  attr_accessible :packing_date, :product_id, :production_run_id, :best_before
  has_many :cartons
  belongs_to :product
  belongs_to :production_run
end
