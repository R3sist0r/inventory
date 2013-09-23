ActiveAdmin.register Product do
  menu :parent => "Produce", :priority => 3
  controller do
    def scoped_collection
      Product.includes(:contains_products)
    end
  end

  index :as => :block do |item|
    children = item.contained_in
    contains = item.contains_products
    if !contains.present?

      div :class => "col_actions" do
          div :style=>"display:inline" do
            link_to "Delete", admin_item_path(item.id), :method => :delete
          end
          div :style=>"display:inline; padding-left: 4px" do 
            link_to "Edit", edit_admin_item_path(item.id)
          end
        end


      div :class => "index_row", :for => item do
        div :class => "col_name" do
          link_to item.name, admin_item_path(item.id)
        end
        div :class => "col", :style=>"font-weight:bold" do
          item.physical_measure
        end
      end
    

      if children.present?
        children.each do |child|
          cls = cycle('oddrow', 'evenrow')
          div :class => "row_child "+cls, :for => item do
            div :class => "col_actions_child" do
              div :style=>"display:inline" do
                link_to "Delete", admin_item_path(child.id), :method => :delete
              end
              div :style=>"display:inline; padding-left: 4px" do 
                link_to "Edit", edit_admin_item_path(child.id)
              end
            end


            div :class => "col_name_child" do
              link_to child.name, admin_item_path(child.id)
            end
            div :class => "col",:style=>"font-weight:bold"  do
              "x " + ProductConversion.where(:product_id => child.id, :contains_product_id=>item.id)[0].conversion.to_s
              # ItemConversion.where(:contains_item_id => child.id, :item_id=>item.id).first.conversion
            end
          end
        end
      end
    end

    
  end


  index do |row| 
    # render :partial => "test", :locals => { :children => row }

    selectable_column
    column :id
    column :name
    
    # column "Sub Categories" do |item|
    #   children = item.contained_in
    #   if children.present?
    #     render :partial => "children", :locals => { :children => children }
    #   end
    # end




    actions
  end

  filter :name

  show do
    attributes_table do
      row :id
      row :name
      row :physical_measure
      row :physical_meaning


      row "Quantity on hand" do |item|
      	item.qty
      end

      row "Stock on hand" do 

        table_for ItemsStock.where(:item_id => item.id) do 
          column :batch_code do |stock| 
			     link_to stock.batch_code, admin_items_stock_path(stock.id)
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



form do |f|

    f.inputs "Details" do
      f.input :name
      f.input :physical_measure
      f.input :physical_meaning
    end
    
    f.has_many :item_conversions do |lines_f|
      lines_f.inputs do 
        lines_f.input :contains_item
        lines_f.input :conversion
      end
    end


    #     # if !lines_f.object.nil?
    #     #   lines_f.input :id
    #     #   # raise lines_f.object.inspect
    #     #   # lines_f.input "composite_item" do |i|
    #     #   #   # raise i.inspect
    #     #   # end


    #     #   # lines_f.input :item
    #     #   # # lines_f.input "name" do |i|
    #     #   #   raise i.inspect
    #     #   # end
    #     # end
        
    #     # 
    #   end
    # end
    f.actions
  end  

end
