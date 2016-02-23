class AddThemeIdToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :theme_id, :integer
  end
end
