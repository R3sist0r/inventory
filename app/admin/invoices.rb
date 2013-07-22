ActiveAdmin.register Invoice do
  controller do
    def scoped_collection
      Invoice.includes(:invoice_lines)
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
    end

    f.has_many :invoice_lines do |lines_f|
      lines_f.inputs do 
        lines_f.input :quantity
        lines_f.input :product
      end
    end
    f.actions
  end  

end
