class RemoveProductIdFromLinks < ActiveRecord::Migration
  def change
    remove_column :links, :product_id, :integer
  end
end
