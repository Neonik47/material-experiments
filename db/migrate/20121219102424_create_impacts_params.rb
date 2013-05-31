class CreateImpactsParams < ActiveRecord::Migration
  def change
    create_table :impacts_params do |t|
      t.integer :method_id
      t.string :name
      t.string :unit

      t.timestamps
    end
  end
end
