ActiveAdmin.register_page "Dashboard" do


  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  action_item do
    link_to "New Production Run", "/admin/production_runs/new"
  end
  action_item do
    link_to "New Packing Run", "/admin/packing_runs/new"
  end
  action_item do
    link_to "New Invoice", "/admin/invoices/new"
  end



  content :title => proc{ I18n.t("active_admin.dashboard") } do
    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Recent Production runs" do
            table_for ProductionRun.limit(5) do
                column :name do |product|
                    link_to product.name, [:admin, product]
                end
            column :production_date
            end
        end
      end

      column do
        panel "Info" do
          para "Welcome to ActiveAdmin. New product"
          
        end
      end
      column do
        panel "Info" do
          para "Welcome to ActiveAdmin."
        end
      end
    end
  end # content
end
