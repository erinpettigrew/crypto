class AddAboutToProducts < ActiveRecord::Migration
  def change
    add_column :products, :about, :string
  end
end
