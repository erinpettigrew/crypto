class CreateProductPosts < ActiveRecord::Migration
  def change
    create_table :product_posts do |t|
      t.integer :product_id, index: true
      t.integer :post_id, index: true
      t.timestamps
    end
  end
end
