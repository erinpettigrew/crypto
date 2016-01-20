class AddIngredientsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :ingredients, :text
  end
end
