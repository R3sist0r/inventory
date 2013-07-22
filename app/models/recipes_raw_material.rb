class RecipesRawMaterial < ActiveRecord::Base
  attr_accessible :quantity, :raw_material_id, :recipe_id, :unit
  belongs_to :raw_material
  belongs_to :recipe
end
