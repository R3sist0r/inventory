ActiveAdmin.register Product do
	menu :parent => "Sell", :priority => 3

	index do
		selectable_column
		column :id
		column :name
		column :created_at
		actions
	end

  # 	index :as => :block do |product|
  # 		table :for => product do
		#   th :for => product do
		# 	   product.name
		#   end
		# end
  # 	end
 
    filter :name	
 
end
