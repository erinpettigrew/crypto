class CreateWants < ActiveRecord::Migration
  def change
    create_table :wants do |t|
      t.integer :user_id
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
