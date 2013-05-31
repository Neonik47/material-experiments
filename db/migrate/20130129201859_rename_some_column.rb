class RenameSomeColumn < ActiveRecord::Migration
  def up
    rename_column :impacts_params, :impacts_id, :impact_id
  end

  def down
  end
end
