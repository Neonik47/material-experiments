class CreateElementExperiments < ActiveRecord::Migration
  def change
    create_table :element_experiments do |t|
      t.references :element
      t.references :experiment

      t.timestamps
    end
    add_index :element_experiments, :element_id
    add_index :element_experiments, :experiment_id
  end
end
