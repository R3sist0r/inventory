ActiveAdmin.register Uom do


form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :abbreviation
      f.input :base_unit
    end

    f.titled_has_many :uoms, header: "Related Units"  do |lines_f|
      lines_f.inputs do 
        lines_f.input :name
        lines_f.input :abbreviation
        lines_f.input :conversion
      end
    end
    f.actions
  end  

	  # sidebar "Related ", only: [:show, :edit] do
	  # 	"I AM REUBEN!"
	  # end

  
end
