class DeleteSomeData < ActiveRecord::Migration
  def up
    remove_column :experiments, :material_id
    remove_column :experiments, :checked
    remove_column :experiments, :confirmed
    add_column :experiments, :name, :string
    add_column :experiments, :status, :integer

    remove_column :nodes, :parent_id
  end

  def down
  end
end
