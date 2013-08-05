ActiveAdmin.register RawMaterial do
  menu :parent => "Produce", :priority => 3

  index do
    column :id
    column :name
    actions
  end

  filter :name

  show do
    attributes_table do
      row :id
      row :name
      row "Quantity on hand" do |raw_material|
      	quantity = 0
      	RawMaterialsStock.where(:raw_material_id => raw_material.id).each do |stock|
      		quantity = quantity + stock.qty
      	end
      	quantity
      end

      row "Stock on hand" do 

        table_for RawMaterialsStock.where(:raw_material_id => raw_material.id) do 
          column :batch_code do |stock| 
			link_to stock.batch_code, admin_raw_materials_stock_path(stock.id)
          end
          
          column "Quantity" do |stock|
          	stock.qty
          end

          # column :batch_code 
          # column "Recipe" do |recipe|
          #   recipe = ProductionRun.find(recipe.production_run_id).recipe
          #   if recipe
          #     link_to recipe.name, admin_recipe_path(recipe.id)
          #   end

          # end
        end
      end
    end
  end

end
