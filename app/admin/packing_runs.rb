ActiveAdmin.register PackingRun do
  menu :parent => "Pack"
  index do
    column :product
    column :packing_date
    column :best_before
    column :id
    default_actions
  end


  controller do
    # Do some custom stuff on GET /admin/websites/*/edit
    def new
      super do |format|
        # Do what you want here ...
        @packing_run.packing_date = Date.today

      end
    end
  end  
end
