ActiveAdmin.register Product do
	menu :parent => "Sell", :priority => 3

	collection_action :autocomplete_admin_user_email, :method => :get

controller do
  autocomplete :admin_user, :email
end


	index do
		selectable_column
		column :id
		column :name
		column :created_at
		actions
	end
 
    filter :name
 
end
