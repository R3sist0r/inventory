ActiveAdmin.register Recipe do
  menu :parent => "Produce", :priority => 3
  controller do
    def scoped_collection
      Recipe.includes(:recipes_raw_materials)
    end
  end
  show do
    attributes_table do
      row :id
      row :name
      row "Ingredients" do
        table_for recipe.recipes_raw_materials do
          column :quantity
          column :raw_material
        end
      end
    

      row :batches do 
        table_for ProductionRun.where(:recipe_id => recipe.id) do 
          column :production_run do |production_run|
            link_to production_run.name, admin_production_run_path(production_run.id)
          end
          column :production_date
        end
      end
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
