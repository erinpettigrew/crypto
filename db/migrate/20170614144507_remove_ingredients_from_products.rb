class RemoveIngredientsFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :ingredients, :text
  end
end
