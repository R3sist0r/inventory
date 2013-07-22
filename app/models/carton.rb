class Carton < ActiveRecord::Base
  attr_accessible :barcode, :packing_run_id, :verified
  belongs_to :packing_run
end
