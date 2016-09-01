class AddCountToProducts < ActiveRecord::Migration
  def change
    add_column :products, :uses_count, :integer
  end
end
