ActiveAdmin.register Recipe do
  controller do
    def scoped_collection
      Recipe.includes(:recipes_raw_materials)
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
    end

    f.has_many :recipes_raw_materials do |lines_f|
      lines_f.inputs do 
        lines_f.input :quantity
        lines_f.input :raw_material
      end
    end
    f.actions
  end  

end
