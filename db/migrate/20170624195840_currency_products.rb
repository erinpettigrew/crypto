class CurrencyProducts < ActiveRecord::Migration
  def change
    create_table :currency_products do |t|
      t.integer :currency_id
      t.integer :product_id
      t.timestamps null: false
    end
  end
end
