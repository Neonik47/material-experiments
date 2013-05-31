class AddAncestryToTree < ActiveRecord::Migration
  def change
    drop_table :materials
    add_column :nodes, :ancestry, :string
  end
end
