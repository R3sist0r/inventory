ActiveAdmin.register ProductionRun do
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
       render :update do |page|
          page.replace_html  'user_list', :partial => 'user', :collection => @users
        page.visual_effect :highlight, 'user_list'
        end
        "hey"
      end
    end
    f.actions
  end
end
