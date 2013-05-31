class ChangeClassOfPublic < ActiveRecord::Migration
  def change
    remove_column :experiments, :public
    add_column :experiments, :public, :integer
  end
end
