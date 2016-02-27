class AddThemeIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :theme_id, :integer
  end
end
