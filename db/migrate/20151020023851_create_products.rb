class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_brand
      t.string :name

      t.timestamps null: false
    end
  end
end
