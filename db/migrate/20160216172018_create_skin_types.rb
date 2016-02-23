class CreateSkinTypes < ActiveRecord::Migration
  def change
    create_table :skin_types do |t|
      t.text :name

      t.timestamps null: false
    end
  end
end
