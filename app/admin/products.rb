ActiveAdmin.register Product do
	menu :parent => "Sell", :priority => 3

	index do
		column :id
		column :name
		column :created_at
		actions
	end
 
    filter :name
 
end
