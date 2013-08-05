class RawMaterialsStock < ActiveRecord::Base
  attr_accessible :qty, :raw_material_id, :batch_code, :recieved_date
  belongs_to :raw_material
end
