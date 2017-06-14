class ChangeProductAttributes < ActiveRecord::Migration
  def change
    rename_column :products, :name, :name
  end
end
