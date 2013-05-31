class AddIndexToNodes < ActiveRecord::Migration
  def change
    add_index :nodes, :ancestry
  end
end
