class AddFieldsIntoExperiments < ActiveRecord::Migration
  def up
    #add_column :experiments, :deleted, :integer
    add_column :experiments, :executed_at, :datetime
    add_column :experiments, :comments, :text

    add_column :users, :status, :integer

  end

  def down
  end
end
