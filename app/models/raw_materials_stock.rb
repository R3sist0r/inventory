class RawMaterialsStock < ActiveRecord::Base
  attr_accessible :qty, :raw_material_id, :batch_code, :RecievedDate
  belongs_to :raw_material

  before_save :convert_quantity

  def convert_quantity
    self.qty = Unit.new(self.qty).to_s
    # false
  end
end