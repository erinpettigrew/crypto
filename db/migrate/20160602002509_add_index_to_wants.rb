class AddIndexToWants < ActiveRecord::Migration
  def change
    add_index :wants, :user_id
    add_index :wants, :product_id
  end
end
