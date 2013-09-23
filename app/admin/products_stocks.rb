ActiveAdmin.register ProductsStock do
  menu :parent => "Produce", :priority => 3

  index do
    selectable_column
    column :id
    column :batch_code
    column :product
    column :qty
    column :recieved_date
    actions
  end

  filter :raw_material

  show do
    attributes_table do
      row :id
      row :product
      row :qty
      row :batch_code

      row :used_in do 
        table_for ProductionRunIngredient.where(:raw_materials_stock_id => products_stock.item_id) do 
          column :production_run
          column "Recipe" do |recipe|
            recipe = ProductionRun.find(recipe.production_run_id).recipe
            if recipe
              link_to recipe.name, admin_recipe_path(recipe.id)
            end

          end
        end
      end
    end
  end

end
