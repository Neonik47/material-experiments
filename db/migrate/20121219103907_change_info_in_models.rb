class ChangeInfoInModels < ActiveRecord::Migration
  def up
    add_column :impacts, :description, :text
    add_column :impacts, :link, :string

    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :middle_name, :string
    add_column :users, :post, :string

  end

  def down
  end
end
