class AddRatingToProducts < ActiveRecord::Migration
  def change
    add_column :products, :rating, :decimal
  end
end
