class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.integer :experiment_id
      t.integer :source_experiment_id

      t.timestamps
    end
  end
end
