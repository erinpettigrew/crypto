class AddIndexToReviews < ActiveRecord::Migration
  def change
    add_index :reviews, :user_id
    add_index :reviews, :product_id
  end
end
