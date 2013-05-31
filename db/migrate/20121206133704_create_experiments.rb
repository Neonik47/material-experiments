# -*- encoding : utf-8 -*-
class CreateExperiments < ActiveRecord::Migration
  def change
    create_table :experiments do |t|
      t.integer :owner_id
      t.integer :confirmatory_id
      t.boolean :public
      t.integer :material_id
      t.integer :impact_id
      t.text :description
      t.boolean :checked
      t.boolean :confirmed

      t.timestamps
    end
  end
end
