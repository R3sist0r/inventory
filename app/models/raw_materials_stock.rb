class RawMaterialsStock < ActiveRecord::Base
  attr_accessible :qty, :raw_material_id, :batch_code
  belongs_to :raw_material
end
