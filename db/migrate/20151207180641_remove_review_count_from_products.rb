class RemoveReviewCountFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :review_count, :integer
  end
end
