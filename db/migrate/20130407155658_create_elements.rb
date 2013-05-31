class CreateElements < ActiveRecord::Migration
  def change
    create_table :elements do |t|
      t.string :name
      t.string :sign
      t.integer :atnum
      t.float :atm

      t.timestamps
    end
  end
end
