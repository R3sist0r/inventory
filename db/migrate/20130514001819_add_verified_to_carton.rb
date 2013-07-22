class AddVerifiedToCarton < ActiveRecord::Migration
  def change
    add_column :cartons, :verified, :boolean
  end
end
