ActiveAdmin.register ProductionRun do
  
  menu :parent => "Produce", :priority => 3

  filter :name
  filter :recipe
  filter :production_date
  filter :recommended_best_before

  index do
    selectable_column
    column :id
    column :name
    column :production_date
    actions
  end

  controller do
    def scoped_collection
      ProductionRun.includes(:production_run_ingredients)
    end

    # Do some custom stuff on GET /admin/websites/*/edit
    def create
      @production_run = ProductionRun.new(params[:production_run])

      params[:stock_line].each do |stock_line|
        @production_run.production_run_ingredients.new(:raw_materials_stock_id => stock_line[0])
      end

      create!
    end
    def new
      super do |format|
        # Do what you want here ...
        @production_run.production_date = Date.today

      end
    end
  end  

  show do
    attributes_table do
      row :name
      row :production_date

      row :production_run_ingredients do 
        table_for production_run.production_run_ingredients do 
          column "Ingredient" do |ingredient|
            @raw_material_stock = RawMaterialsStock.find(ingredient.raw_materials_stock_id)
            @raw_material = RawMaterial.find(@raw_material_stock.raw_material_id)
            link_to @raw_material.name, admin_raw_material_path(@raw_material.id)
          end
          column "Batch Code" do |ingredient|
            @raw_material_stock = RawMaterialsStock.find(ingredient.raw_materials_stock_id)
            link_to @raw_material_stock.batch_code, admin_raw_materials_stock_path(ingredient.raw_materials_stock_id)
          end
          column "Quantity Adjustment" do |ingredient|
            ingredient.adjustment_qty
          end
          # column "Batch code" do

        end
      end
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :production_date
      if f.object.new_record?
        f.input :recipe, :input_html => { :onchange => "loadRecipe()" } 
      else
        f.form_buffers.last << javascript_tag("loadRecipeEdit(18)")
        # @new_toggle = true;
        # f.input :recipe
        # 
      end
    end
    f.actions
  end


end
