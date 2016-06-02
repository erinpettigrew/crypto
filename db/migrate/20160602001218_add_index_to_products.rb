class AddIndexToProducts < ActiveRecord::Migration
  def change
    add_index :products, :category_id
    add_index :products, :theme_id
  end
end
