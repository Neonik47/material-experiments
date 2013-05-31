class CreateExperimentsImpactsParams < ActiveRecord::Migration
  def change
    create_table :experiments_impacts_params do |t|
      t.integer :experiment_id
      t.integer :param_id
      t.string :value

      t.timestamps
    end
  end
end
