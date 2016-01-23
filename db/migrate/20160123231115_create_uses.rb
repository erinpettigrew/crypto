class CreateUses < ActiveRecord::Migration
  def change
    create_table :uses do |t|
      t.integer :user_id
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
