class AddReviewCountToProducts < ActiveRecord::Migration
  def change
    add_column :products, :review_count, :integer
  end
end
