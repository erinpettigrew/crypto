class AddProductIdToLinks < ActiveRecord::Migration
  def change
    add_column :links, :product_id, :integer
  end
end
