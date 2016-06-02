class AddIndexToUses < ActiveRecord::Migration
  def change
    add_index :uses, :user_id
    add_index :uses, :product_id
  end
end
