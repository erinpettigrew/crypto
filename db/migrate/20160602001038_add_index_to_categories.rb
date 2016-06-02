class AddIndexToCategories < ActiveRecord::Migration
  def change
    add_index :categories, :theme_id
  end
end
