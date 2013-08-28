class CreateUoms < ActiveRecord::Migration
  def change
    create_table :uoms do |t|
      t.string :name
      t.string :abbrevian
      t.integer :parent_id
      t.float :conversion

      t.timestamps
    end
  end
end
