class AddNodeInExperiment < ActiveRecord::Migration
  def up
    add_column :experiments, :node_id, :integer
  end

  def down
  end
end
