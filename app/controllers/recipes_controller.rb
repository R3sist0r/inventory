class RecipesController < ActionController::Base
  def load_recipe
    recipe_raw = Recipe.find(params[:id])
    recipe_lines = recipe_raw.recipes_raw_materials

    @lines = Array.new

    recipe_lines.each do |line|
      out = Hash.new
      out[:name] = line.raw_material.name
      out[:material_id] = line.raw_material.id
      out[:qty] =line.quantity
      stocks = line.raw_material.raw_materials_stocks
      @stock_hash = Array.new

      stocks.each do |stock|
        @stock = Hash.new
        @stock[:batch_code] = stock.batch_code
        @stock[:batch_id] = stock.id

        @stock_hash.push(@stock)
      end
      out[:stock] = @stock_hash
      @lines.push(out)  
    end

    render json: @lines
  end

  def load_production_run
    production_run = ProductionRun.find(params[:id])
    production_ingredients = production_run.production_run_ingredients
    recipe_raw = Recipe.find(production_run.recipe_id)
    recipe_lines = recipe_raw.recipes_raw_materials

    @lines = Array.new

    recipe_lines.each do |line|
      out = Hash.new
      out[:name] = line.raw_material.name
      out[:material_id] = line.raw_material.id
      out[:qty] =line.quantity
      out[:selected] = production_ingredients.select{ |hash| hash["raw_materials_stock_id"] == line.raw_material.id }[0].raw_materials_stock_id
      stocks = line.raw_material.raw_materials_stocks
      @stock_hash = Array.new

      stocks.each do |stock|
        @stock = Hash.new
        @stock[:batch_code] = stock.batch_code
        @stock[:batch_id] = stock.id

        @stock_hash.push(@stock)
      end
      out[:stock] = @stock_hash
      @lines.push(out)  
    end

    render json: @lines

  end


end 